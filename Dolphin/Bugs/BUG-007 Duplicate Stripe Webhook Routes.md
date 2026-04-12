---
tags: bug
status: open
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

## Required Action
1. Check which URL is configured in the Stripe webhook dashboard
2. Update Stripe to point to: `POST /api/stripe/webhook`
3. Delete `app/api/stripe/stripe-webhook/route.ts`

The old file has been marked with a deprecation warning in the header comment.
