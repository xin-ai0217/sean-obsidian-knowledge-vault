---
id: BUG-008
severity: 🔴 Sev 0 — Critical
status: Fixed
opened: 2026-04-15
fixed: 2026-04-15
commit: 89f74cb
area: interview, mobile, iOS
---

# BUG-008 — iOS Microphone Silent After AI Audio Plays

## Symptom

On iOS Safari, the microphone only captured audio during Maya's opening greeting. Every subsequent participant turn was silent — the UI showed "Listening…" but no speech was ever transcribed. The MediaRecorder appeared to be running (state: "recording") but every chunk it produced was empty/muted.

---

## Root Cause

iOS manages audio hardware through **AVAudioSession**. When a web page plays audio via an `<audio>` element, iOS switches the session from **PlayAndRecord** → **Playback** mode. In Playback mode the microphone is fully disabled at the OS level.

After the audio finishes, iOS does **not** automatically switch back to PlayAndRecord. The only thing that triggers the switch is a new **`getUserMedia()`** call. No amount of re-enabling `track.enabled`, waiting for `unmute` events, or restarting the MediaRecorder on the existing stream fixes it — the OS simply won't re-enter PlayAndRecord unless you make the actual syscall.

---

## Fix Attempts (what worked and what didn't)

### Attempt 1 — 250ms timeslice + longer onstop delay ✅ Partial fix
**Commit:** 3bddcf9

Changed `mediaRecorder.start()` → `mediaRecorder.start(250)` so chunks arrive continuously rather than only on `stop()`. Increased the post-`requestData()` delay from 75ms to 300ms.

**Result:** Fixed audio loss due to chunks arriving after `onstop` on Android/desktop. Did NOT fix iOS — the underlying AVAudioSession problem was not yet understood.

---

### Attempt 2 — "Always-on" MediaRecorder with `isCapturingRef` gate ❌ Broke iOS further
**Commit:** 3a0a767

Kept the MediaRecorder running for the entire interview. Added `isCapturingRef` boolean ref to gate which chunks land in the buffer (only `true` during participant turns). Intended to eliminate warm-up delay.

**Result:** Did not fix iOS. The recorder was running, but because iOS switched AVAudioSession to Playback during AI speech, all chunks produced during the participant's turn were silence. Two additional bugs were also introduced:
1. `startListening()` skipped `ensureMicStream()` in the happy path → tracks never re-enabled
2. `isCapturingRef` was set to `false` *before* `requestData()` → final chunk was discarded

---

### Attempt 3 — Fix two bugs from Attempt 2, add `unmute` event wait ❌ Still broken on iOS
**Commit:** 06e9c70

Fixed both bugs: `startListening()` always calls `ensureMicStream()` and re-enables `track.enabled`; `requestData()` now fires before `isCapturingRef` is set to `false`.

Added a wait for the `unmute` event (up to 400ms) before opening the capture gate, on the theory that iOS would fire it once the audio session switched back.

**Result:** The `unmute` event approach was the wrong model. iOS fires `unmute` inconsistently — and more importantly, `track.enabled = true` does not trigger an AVAudioSession mode switch. iOS ignores the JS-level track state for session management. The mic stayed silent.

---

### Attempt 4 — `refreshMicForListening()` with fresh `getUserMedia()` ✅ Fixed
**Commit:** 89f74cb

Added `refreshMicForListening()` which runs after every AI audio segment (inside `playAiAudio()`):

1. Stop and detach the existing MediaRecorder (null out `onstop` to prevent side effects)
2. Stop all tracks on the old stream (releases the OS audio session cleanly)
3. Call `getUserMedia()` fresh — this is the syscall iOS needs to switch back to PlayAndRecord
4. Start a new MediaRecorder on the new stream (`isCapturingRef` stays `false` until `startListening()` opens the gate)

Run concurrently with a 150ms minimum gap via `Promise.all` so the OS has time to release the session before the new request arrives.

Simplified `startListening()` — removed the `ensureMicStream()` call and `unmute` wait. No longer needed since `refreshMicForListening()` already produces a fresh, live, unmuted stream.

**Result:** Confirmed working on iOS Safari. All participant turns captured correctly.

---

## Key Insight for Future Reference

> On iOS, re-enabling `track.enabled` or restarting a MediaRecorder on an existing stream does **nothing** to the AVAudioSession mode. The session stays in Playback. The mic stays dead.
>
> The only fix is `getUserMedia()`. Every time AI audio plays, throw away the stream and get a new one.

Because mic permission was already granted during `startInterview()` (tied to the user's button tap), subsequent `getUserMedia()` calls succeed without a new user gesture on iOS 14.5+.

---

## Files Changed

- `components/interview/InterviewRoom.tsx`
  - Added `refreshMicForListening()` function
  - `playAiAudio()` now calls it via `Promise.all` with 150ms floor
  - `startListening()` simplified — no more `ensureMicStream()` or `unmute` wait
  - Removed `startPersistentRecorder()` call from `startInterview()`
