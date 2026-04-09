---
id: DEV-017
status: Done
priority: 🟠 Medium
created: 2026-04-09
completed: 2026-04-09
---

# DEV-017 — SendGrid Integration

**What:** Replaced Resend with SendGrid for all outgoing email. `lib/email.ts` now supports both providers and picks SendGrid when `SENDGRID_API_KEY` is present. `RESEND_API_KEY` commented out in `.env.local` to prevent silent fallback to broken shared sender.

**Production:** `SENDGRID_API_KEY` + `SENDGRID_FROM_EMAIL=seanxin@tencent.com` added to Vercel env vars and deployed. Gmail delivery confirmed ✅.

**Temporary:** Sender is `seanxin@tencent.com` (single sender verification — test only). Needs proper domain to go to production. See [[DEV-003 Custom Domain]].
