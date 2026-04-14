---
tags: bug
status: fixed
severity: critical
area: recruitment, payments
---

# BUG-007 Duplicate Stripe Webhook Routes

## Summary
There are two separate Stripe webhook handler routes in the codebase:

| Route | File | Status |
|-------|------|--------|
| `/api/stripe/webhook` | `app/api/stripe/webhook/route.ts` | ✅ Current — uses `launchRecruitment`, supports `rejectFastSubmissions`, correct idempotency |
| `/api/stripe/stripe-webhook` | `app/api/stripe/stripe-webhook/route.ts` | ❌ Deprecated — uses old `lib/prolific.ts` |

## Problems with the old route
1. Uses `createAndPublishCampaign` from `lib/prolific.ts` which does **NOT** support `rejectFastSubmissions` → that feature silently does nothing if this route is active
2. `paymentIntentId` typed as `string` (not `string | null`) — crashes if Stripe sends a checkout session without a payment intent (e.g. for free sessions)
3. No `sendAdminAlert` on failure
4. Doesn't use the multi-platform `launchRecruitment` orchestration layer

## Resolution
Confirmed 2026-04-14:
- Stripe webhook dashboard points to `https://research-platform-ivory.vercel.app/api/stripe/webhook` ✅
- Deprecated route `app/api/stripe/stripe-webhook/route.ts` does not exist in the codebase ✅
- No action required. Bug was a false alarm — old route was already removed.
