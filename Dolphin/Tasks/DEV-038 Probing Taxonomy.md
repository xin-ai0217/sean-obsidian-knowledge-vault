# DEV-038 Probing Taxonomy

## Status
Done

## Completed
2026-04-15

## Summary
Replaced the generic follow-up instructions in the AI interviewer system prompt with a structured 13-type probing taxonomy based on qualitative research best practice. Every Maya response now begins with a `[PROBE:TYPE]` tag that classifies the probing move — the tag is stripped before TTS and display.

## Motivation
Probing was previously handled via soft instructions ("ask a follow-up if the answer is short"). That produced generic, low-signal follow-ups. The taxonomy forces the LLM to identify the *kind* of probe needed before generating the text, producing sharper, more intentional follow-ups — the foundation of our research moat.

## Probe Types (13)

| Tag | When to use |
|-----|-------------|
| CONCRETISE | Vague/general language — "usually", "sometimes", "people" |
| ELABORATE | Short answer (~20 words), one-liner, or trails off |
| CLARIFY | Jargon or ambiguous term used |
| TIMELINE | Behaviour described generally, no sequence of events |
| LADDER_UP | Behaviour stated with no reason — the "what" without the "why" |
| LADDER_DOWN | Abstract value stated ("convenience", "trust", "quality") |
| EMOTIONAL | Loaded word detected (frustrating, surprising, love, hate…) |
| SIGNIFICANCE | Factual statement, no personal meaning attached |
| CONTRAST | Reference to past behaviour, a change, or implicit comparison |
| ECHO | Trails off or seems to have more unsaid — use sparingly |
| HYPOTHETICAL | Stuck describing what is; needs to explore counterfactuals |
| CONTRADICTION | Current statement conflicts with something said earlier |
| MOVE_ON | Answer is specific, complete, no gap remains. Transition |

## Probe Label Rules
- `[no follow-up]` → always MOVE_ON
- `[light probe]` → taxonomy, max 1 follow-up
- `[deep probe]` → taxonomy, max 2 follow-ups

## Implementation

### `lib/interview.ts`
- Added `parseProbeOutput(raw)` — strips `[PROBE:TYPE]` tag, returns `{ probeType, text }`. Degrades gracefully if tag missing.
- Replaced verbose FOLLOW-UP GUIDE with condensed taxonomy (~440 tokens vs ~1550 tokens previously)
- Reduced `max_tokens` 350 → 150 (1–3 sentences is all Maya needs)

### `app/api/interview/[sessionId]/turn/route.ts`
- Calls `parseProbeOutput()` on raw LLM output
- `probeType` available for future logging/analytics (`void probeType` until then)

### `app/api/interview/[sessionId]/skip/route.ts`
- Same `parseProbeOutput()` treatment

## Latency Impact
Token reduction + lower max_tokens cut observed LLM response time significantly. Combined with SSE streaming (DEV-039), the perceived latency from participant speaking to Maya responding is substantially reduced.
