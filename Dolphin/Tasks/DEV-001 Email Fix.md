---
id: DEV-001
status: In Progress
priority: 🟠 Medium
created: 2026-04-09
completed:
---

# DEV-001 — Email Fix

**What:** Invites only land in Gmail. Chinese enterprise email (Tencent etc) silently dropped because the current sender `onboarding@resend.dev` is a shared test address — by design it can only deliver to emails registered on the Resend account. Same restriction applies to SendGrid without a verified sender.

**Fix path:**
- Short term: swap Resend → SendGrid, verify personal email as sender → anyone can receive ✅
- Permanent: buy a domain, verify DNS → send from `noreply@yourdomain.com`

**Linked bugs:** [[BUG-001 Email Deliverability]]

---

### Notes

- Gmail ✅ delivered
- Tencent ⚠️ delivered to Tencent mail server but blocked internally by their enterprise security policy — recipient never sees it. This is a Tencent IT policy issue, not a sender/deliverability issue on our end. A custom domain with proper SPF/DKIM may improve this but not guaranteed.

---

### Subtasks

- [x] Identify root cause (shared sender restriction)
- [x] Codex: swap Resend → SendGrid
- [x] Test delivery to Gmail + Tencent enterprise email
- [ ] Buy domain (Cloudflare Registrar, ~$10/yr)
- [ ] Verify domain DNS on email provider
- [ ] Update sender to `noreply@yourdomain.com`
- [ ] Update `SENDGRID_FROM_EMAIL` env var in Vercel
