---
id: DEV-006
status: Planned
priority: 🟡 Low
created: 2026-04-09
completed:
---

# DEV-006 — Prolific Campaign: Edit Live

**What:** Once a Prolific campaign is running, the researcher should be able to increase the number of participant slots or bump the reward per person — without creating a whole new campaign. Prolific's API supports this on live studies.

---

### Subtasks

- [ ] Add PATCH endpoint calling Prolific `/studies/{id}/` with updated slots or reward
- [ ] Add editable slots + reward fields in the campaign dashboard UI
- [ ] Calculate billing delta (new total minus already paid)
- [ ] Trigger a new Stripe Checkout session for the difference
- [ ] Update `prolific_study_id` record if needed
