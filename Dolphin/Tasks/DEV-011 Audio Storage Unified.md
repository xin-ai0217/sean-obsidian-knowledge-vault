---
id: DEV-011
status: Done
priority: 🟠 Medium
created: 2026-04-09
completed: 2026-04-09
---

# DEV-011 — Audio Storage Unified

**What:** Both AI-generated audio (TTS) and participant audio now live under the same path: `sessions/{sessionId}/turns/`. AI audio path is saved in `turns.audio_path` so it can be found and deleted when a study is removed. Deep delete now cleans up all audio files properly.
