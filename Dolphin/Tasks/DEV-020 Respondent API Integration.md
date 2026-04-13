---
id: DEV-020
status: Planned
priority: 🟡 Low
created: 2026-04-13
completed:
---

# DEV-020 — Respondent API Integration

**What:** Add Respondent as a second recruitment platform adapter alongside Prolific. Researchers see no difference — Dolphin silently routes to the best available platform.

---

## Why Respondent

- **4M participants** vs Prolific's 200k active — meaningful pool expansion
- **B2B/professional skew** — different demographic from Prolific, genuinely additive coverage
- **Whitelabeling explicitly supported** — they are fine with partners hiding their brand
- **Voice/video specialist** — they specifically call out audio/video participants as their strength, direct match for Dolphin interviews
- **They handle participant payouts** — no additional payment infrastructure needed
- **60+ platforms already use their API** — mature, proven integration path

---

## Pre-requisites

- [ ] **Contact Respondent integration team** — API is partner-gated, not self-serve
  - CTA: https://www.respondent.io/api → "Talk to our Integration Specialist"
  - Ask for: API docs, sandbox credentials, wholesale pricing, whitelabel confirmation
- [ ] **Review their API docs** (linked from respondent.io/api → "View documentation")
- [ ] **Confirm they support external study URLs** — Dolphin needs participants redirected to `/i/{share_token}`

---

## Implementation plan (once API access confirmed)

- [ ] Build `lib/platforms/respondent.ts` implementing `PlatformAdapter`
  - `checkEligibility(criteria)` — map Dolphin filters to Respondent screening
  - `estimateCost(criteria)` — their cost calculator endpoint
  - `createCampaign(study, criteria, appUrl)` — create + launch project
  - `getCampaignStatus`, `pauseCampaign`, `resumeCampaign`
- [ ] Add `respondentAdapter` to `ALL_PLATFORMS` in `lib/recruitment.ts`
- [ ] Map Dolphin canonical filters → Respondent filter schema
- [ ] Add `RESPONDENT_API_KEY` to Vercel env vars
- [ ] Test end-to-end in staging

---

## Notes

- The adapter stub is already referenced in `lib/recruitment.ts` as a comment placeholder
- Pricing model differs from Prolific: recruit fee per completed session + incentive balance (Respondent manages payouts)
- Their API integration typically takes ~2 weeks per their documentation
