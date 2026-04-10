---
id: DEV-007
status: In Progress
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

**Filter ID resilience (BUG-004) — SOLVED**
`FILTER_REGISTRY` in `lib/prolific.ts` uses two-layer resolution: primary ID match first, keyword fallback second. `resolveChoiceId()` uses keyword matching against live Prolific choice labels — no hardcoded ID mappings. `getRawFilters()` caches full filter list for 1hr with stale-on-error fallback.

**`study_labels: ["interview"]` — ADDED**
Study creation payload now includes correct label.

**`{{%SESSION_ID%}}` in interview URL — ADDED**
URL now includes both `{{%PROLIFIC_PID%}}` and `{{%SESSION_ID%}}` so Prolific submission ID can be linked to our sessions.

**`maximum_allowed_time` formula — FIXED**
Now uses correct Prolific formula: `Math.ceil(2 + 2t + 2√t)`.

---

## Still needs work ⚠️

**BUG-005 — Draft study lost on publish failure**
If Prolific balance is insufficient: draft is created on Prolific → publish fails → we auto-refund → but the Prolific draft ID is never saved to our DB. Orphaned draft sits on Prolific. Researcher can't find or retry it.

**No alerting when keyword fallback fires**
`resolveFilterDef()` logs a `console.warn` when keyword fallback is used — but nobody reads console logs. Needs a real alert to admin (email/Slack) so the registry can be updated promptly. See [[DEV-018 Multi-Platform Recruitment Architecture]].

**No workspace/project specified**
We don't set `project` on study creation — Prolific auto-assigns to first project. Fine for single-workspace accounts but will break if researcher has multiple workspaces.

**`GET /api/prolific/filters` called on form open**
Current implementation fetches live Prolific filter options when the recruit form mounts. This couples the form to Prolific's availability. Being replaced by Dolphin's own canonical schema — see [[DEV-018 Multi-Platform Recruitment Architecture]].

---

## Subtasks

- [x] Double-spend idempotency guard
- [x] Live filter fetch with 1hr cache
- [x] Make filter ID matching resilient (two-layer: ID match + keyword fallback)
- [x] Add `study_labels: ["interview"]` to study creation payload
- [x] Add `{{%SESSION_ID%}}` to interview URL
- [x] Fix `maximum_allowed_time` formula
- [ ] Save `prolific_study_id` to DB before publish attempt, not after (BUG-005)
- [ ] Add `prolific_status` column: `draft` | `active` | `paused` | `completed`
- [ ] Add alerting when keyword fallback fires → see DEV-018
- [ ] Fetch and store workspace/project ID on first campaign creation
