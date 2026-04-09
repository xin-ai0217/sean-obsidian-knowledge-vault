---
id: BUG-003
severity: 🔴 Sev 0 — Fix immediately
status: Fixed
opened: 2026-04-09
fixed: 2026-04-09
linked-task: "[[DEV-007 Prolific Integration Hardening]]"
---

# BUG-003 — Prolific Double-Spend Risk on Webhook Retry

**Status: Fixed** ✅

The webhook implements a two-layer guard:
1. Checks `prolific_study_id IS NOT NULL` — if already set, exits with 200 immediately
2. Atomic `stripe_session_id` claim using UNIQUE DB constraint — only one concurrent webhook wins; the loser sees 0 rows affected and exits cleanly
3. On Prolific failure: clears the session claim and auto-refunds via Stripe

This was already implemented correctly. See [[DEV-007 Prolific Integration Hardening]].
