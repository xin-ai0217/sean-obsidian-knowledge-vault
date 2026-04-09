---
id: DEV-006
status: In Progress
priority: 🟠 Medium
created: 2026-04-09
completed:
depends-on: DEV-007
---

# DEV-006 — Prolific Campaign: Edit Live

**What:** Once a Prolific campaign is running, researcher can increase participant slots or bump reward — without creating a new campaign. Prolific API supports updating live studies.

**API facts (from docs):**
- Only `total_available_places` (increase only), `internal_name`, and `submissions_config` can be changed on a published study
- Reward per participant CANNOT be changed after publishing — new campaign needed
- Increasing places requires sufficient account balance in Prolific web app

---

### Subtasks

- [ ] Add PATCH endpoint calling Prolific `/studies/{id}/` with updated slots
- [ ] Show editable slots field in campaign dashboard UI
- [ ] Calculate billing delta and trigger new Stripe session for difference
- [ ] Handle error when Prolific balance is insufficient
