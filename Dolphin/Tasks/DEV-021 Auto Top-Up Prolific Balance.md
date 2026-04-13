---
id: DEV-021
status: Planned
priority: 🟡 Low
created: 2026-04-13
completed:
---

# DEV-021 — Auto Top-Up Prolific Balance

**What:** Eliminate the double-payment UX where researchers must manually top up their Prolific workspace before a Dolphin-launched study can publish. Researcher should pay Dolphin once and everything else happens automatically.

---

## Current flow (bad UX)
1. Researcher manually tops up Prolific workspace (e.g. $20)
2. Researcher pays Dolphin via Stripe (e.g. $25 with markup)
3. Dolphin calls Prolific API → study publishes using existing balance

## Target flow
1. Researcher pays Dolphin via Stripe
2. Dolphin automatically funds the Prolific workspace with the exact amount needed
3. Study publishes immediately — no manual Prolific top-up required

---

## Investigation needed

- [ ] Does Prolific expose a **billing/top-up API endpoint**? Check Prolific API docs
- [ ] If yes: wire into `app/api/stripe/webhook/route.ts` — after Stripe payment confirmed, top up Prolific balance before calling `createAndPublishCampaign`
- [ ] If no: explore Prolific's prepay/credit system — may need to maintain a standing float account

## Alternative (simpler, works now)
Maintain a standing Prolific balance (e.g. $500 float) funded manually. Dolphin collects researcher payments via Stripe. Reconcile monthly. This is how most research platforms operate with panel providers.

---

## Notes
- This is currently a known limitation — researchers need to pre-fund Prolific separately
- Medium priority: workaround is to keep a Prolific float balance topped up manually
- Related: [[DEV-020 Respondent API Integration]] — same issue will apply to Respondent
