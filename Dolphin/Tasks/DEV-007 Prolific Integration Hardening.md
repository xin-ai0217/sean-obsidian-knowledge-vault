---
id: DEV-007
status: Planned
priority: 🟠 Medium
created: 2026-04-09
completed:
---

# DEV-007 — Prolific Integration Hardening

**What:** Tighten the Prolific integration based on a full read of their API docs. Several issues were identified — most are already handled, a few still need work.

---

## Already handled ✅

**Double-spend on webhook retry (BUG-003) — SOLVED**
Webhook has a two-layer guard: (1) checks `prolific_study_id IS NOT NULL` — if set, exits immediately. (2) Atomic `stripe_session_id` claim using UNIQUE DB constraint — only one concurrent webhook wins the race. Auto-refund on Prolific failure. This is solid.

**Filter IDs fetched live — SOLID**
`lib/prolific.ts` already calls `GET /api/v1/filters/` at runtime and caches for 1hr. Not hardcoded.

---

## Still needs work ⚠️

**BUG-004 — Filter ID string matching is fragile**
We match on hardcoded strings like `filter.filter_id === "current-country-of-residence"`. If Prolific renames a filter ID, the filter is silently skipped (no error, no warning). Low probability but worth making more resilient.

**BUG-005 — Draft study lost on publish failure**
If Prolific balance is insufficient: draft is created on Prolific → publish fails → we auto-refund → but the Prolific draft ID is never saved to our DB. Orphaned draft sits on Prolific. Researcher can't find or retry it.

**Missing: `prolific_submission_id` on sessions**
We pass `{{%PROLIFIC_PID%}}` in the interview URL (captures participant ID) but not `{{%SESSION_ID%}}` (Prolific's submission ID). Without it we can't approve/reject individual submissions from our dashboard.

**Missing: `study_labels: ["interview"]`**
Should tag study type so it shows correctly in Prolific's UI.

**No workspace/project specified**
We don't set `project` on study creation — Prolific auto-assigns to first project. Fine for single-workspace accounts but will break if researcher has multiple workspaces.

---

## Subtasks

- [x] Double-spend idempotency guard
- [x] Live filter fetch with 1hr cache
- [ ] Make filter ID matching resilient (log warning when filter not found)
- [ ] Save `prolific_study_id` to DB before publish attempt, not after
- [ ] Add `prolific_status` column: `draft` | `active` | `paused` | `completed`
- [ ] Add `{{%SESSION_ID%}}` to interview URL → save as `prolific_submission_id` on session
- [ ] Add `study_labels: ["interview"]` to study creation payload
- [ ] Fetch and store workspace/project ID on first campaign creation
