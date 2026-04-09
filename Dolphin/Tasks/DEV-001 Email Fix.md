---
id: DEV-001
status: In Progress
priority: 🟠 Medium
created: 2026-04-09
completed: 2026-04-09
---

# DEV-001 — Email Fix

**What:** Invites only landed in Gmail. Chinese enterprise email (Tencent etc) was silently dropped because `onboarding@resend.dev` is a shared Resend sandbox — by design it only delivers to verified Resend account emails.

**Resolution:**
- Switched to SendGrid with single sender verification (`seanxin@tencent.com`)
- `lib/email.ts` now picks SendGrid when `SENDGRID_API_KEY` is present, falls back to Resend
- `RESEND_API_KEY` commented out in `.env.local` to prevent silent fallback
- `SENDGRID_API_KEY` + `SENDGRID_FROM_EMAIL` added to Vercel env vars and deployed
- Production now sends via SendGrid ✅

**Remaining (nice to have):** Buy a domain → use `noreply@yourdomain.com` for professional branding. See [[DEV-003 Custom Domain]].

**Linked bugs:** [[BUG-001 Email Deliverability]]

---

### Subtasks

- [x] Identify root cause (shared sender restriction)
- [x] Codex: swap Resend → SendGrid
- [x] Test delivery to Gmail + Tencent enterprise email
- [x] Add `SENDGRID_API_KEY` + `SENDGRID_FROM_EMAIL` to Vercel env vars
- [x] Redeploy to production — SendGrid now active in prod
- [x] Comment out `RESEND_API_KEY` in `.env.local` to prevent fallback
- [ ] Buy domain → update sender to `noreply@yourdomain.com` (tracked in DEV-003)
