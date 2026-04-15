# DEV-039 LLM Response Streaming

## Status
Done

## Completed
2026-04-15

## Summary
Replaced the single-shot LLM → TTS → JSON pipeline with a Server-Sent Events (SSE) streaming pipeline. TTS for each sentence now runs concurrently with the remaining LLM generation, cutting perceived response latency significantly.

## Motivation
After the probing taxonomy (DEV-038) reduced LLM token count, the remaining latency was dominated by:
1. Waiting for the full LLM response before starting TTS
2. Waiting for TTS to complete before returning any audio to the client

With 2–3 sentence responses, the old pipeline was: LLM (~2s) → TTS (~1s) → client receives audio = ~3s dead time.

## New Pipeline

```
LLM token stream → sentence extracted → TTS fired in background (no await)
                                      → {type:"text"} SSE event → client shows sentence

After all sentences complete:
→ Promise.all(ttsPromises) resolves (TTS ran concurrently, most already done)
→ {type:"audio", url, idx} events sent per chunk
→ DB save
→ {type:"done", is_complete, turn_index}
```

**Net win:** TTS for all N sentences runs in parallel, not serially. Total TTS time ≈ max(single sentence TTS) not sum. For a 3-sentence response, this is ~3× faster TTS resolution.

## SSE Event Protocol

| Event | Payload | When |
|-------|---------|------|
| `transcript` | `{ text }` | First — participant's transcribed text |
| `text` | `{ text, idx }` | Per sentence, as LLM generates it |
| `audio` | `{ url, idx, }` | Per sentence, as TTS resolves |
| `done` | `{ is_complete, turn_index }` | After all TTS complete + DB save |

## Implementation

### `lib/ai.ts`
- Added `chatStream(messages, maxTokens): AsyncGenerator<string>`
- Uses `stream: true` with MiniMax; parses SSE `data:` lines; yields content tokens
- Handles `[DONE]`, malformed lines, and both `delta.content`/`message.content` formats

### `lib/interview.ts`
- Added `extractSentences(text): [string[], string]`
- Splits on `(?<=[.!?])\s+` (lookbehind — only splits where punctuation is actually followed by whitespace)
- Returns `[completeSentences[], remainder]`

### `app/api/interview/[sessionId]/turn/route.ts`
- Full SSE rewrite using `ReadableStream` with `text/event-stream` response
- `[PROBE:TYPE]` tag stripped from accumulated text before sentence extraction
- 30-char buffer heuristic to detect when probe tag has been fully streamed
- `stripEndInterviewMarker` + `stripPrematureTimeWarning` applied per sentence (keeps TTS clean)
- Audio files stored at `sessions/{sessionId}/turns/{turn}-sentence-{idx}-ai.mp3` (under session folder for cleanup)
- `turns.audio_path` = null for streamed turns (no single path)
- Added `export const maxDuration = 60` for Vercel timeout
- Overtime path also uses SSE for consistency

### `components/interview/InterviewRoom.tsx`
- `submitTurn()` rewritten to read SSE stream
- Text events update `aiText` sentence-by-sentence during `processing` phase (user sees text appearing instead of just a spinner)
- Added `playAiAudioMulti(chunks, fullText, sid)` — plays audio chunks sequentially, then refreshes mic
- Added `playFinalAiAudioMulti(chunks, fullText)` — same but transitions to `awaiting_complete`
- Timeout increased 35s → 60s for streaming responses
- No word animation during multi-chunk playback (text already appeared progressively)

## UX Change
Before: user sees spinner for ~3s, then Maya's audio starts.
After: user sees text appearing sentence-by-sentence during `processing`, then audio plays immediately.

## Backward Compatibility
- Skip route unchanged (single-shot, not worth streaming)
- Start route unchanged (single greeting, not worth streaming)
- Overtime handling preserved, now delivered via SSE
