---
id: BUG-005
severity: 🟠 Sev 1 — Fix soon
status: Open
opened: 2026-04-09
fixed:
linked-task: "[[DEV-007 Prolific Integration Hardening]]"
---

# BUG-005 — Prolific Draft Study Lost on Publish Failure

**Symptom:** If Prolific balance is insufficient, `createAndPublishCampaign()` creates a draft on Prolific but publish fails. We return `status: "draft_needs_funding"` but never save the draft's Prolific study ID to our DB. The researcher has no way to find or retry the draft — it orphans on Prolific.

**Fix:** Save `prolific_study_id` to DB immediately after draft creation succeeds, before attempting publish. Add a `prolific_status` column so we can distinguish `draft` from `active`. See [[DEV-007 Prolific Integration Hardening]].
