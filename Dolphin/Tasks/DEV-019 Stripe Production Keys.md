---
id: DEV-019
status: In Progress
priority: 🔴 High
created: 2026-04-12
completed:
---

# DEV-019 — Switch Stripe to Production

**What:** Replace test Stripe API keys with live production keys so researchers can pay with real money.

---

## Checklist

- [ ] **Activate your Stripe account** — complete identity verification at dashboard.stripe.com/account if not already done
- [ ] **Get live keys** — dashboard.stripe.com/apikeys → copy `sk_live_...` and `pk_live_...`
- [ ] **Update Vercel env vars**
  - `STRIPE_SECRET_KEY` → `sk_live_...`
  - `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY` → `pk_live_...`
- [ ] **Create a live webhook** — dashboard.stripe.com/webhooks → Add endpoint
  - URL: `https://research-platform-ivory.vercel.app/api/stripe/webhook`
  - Events: `checkout.session.completed`
  - Copy the new `whsec_live_...` signing secret
- [ ] **Update webhook secret in Vercel**
  - `STRIPE_WEBHOOK_SECRET` → `whsec_live_...` (the live one, not the test one)
- [ ] **Redeploy on Vercel** to pick up new env vars
- [ ] **Test with a real card** — do one end-to-end payment to confirm campaign launches

---

## Notes

- Test keys (`sk_test_...`) and live keys (`sk_live_...`) are completely separate — webhooks, sessions, and events do not cross between them
- The webhook endpoint URL stays the same — just the secret changes
- Stripe charges a fee (~2.9% + $0.30) on live transactions — factor this into pricing if needed
- Keep test keys in a `.env.local` for local development
