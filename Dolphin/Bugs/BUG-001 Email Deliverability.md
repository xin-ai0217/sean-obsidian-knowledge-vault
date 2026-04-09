---
id: BUG-001
severity: 🟡 Sev 2 — Nice to fix
status: Open
opened: 2026-04-09
fixed:
linked-task: "[[DEV-001 Email Fix]]"
---

# BUG-001 — Email Invites Fail for Non-Gmail

**Symptom:** Researcher sends invites to 3 emails. Gmail receives it. Two Tencent enterprise emails get nothing — not even in spam.

**Root cause:** Sender was `onboarding@resend.dev`, a shared Resend sandbox that only delivers to verified Resend account emails.

**Fix:** Switched to SendGrid with single sender verification. `SENDGRID_API_KEY` added to Vercel. Production now uses SendGrid. Gmail confirmed working ✅.

**Residual note:** Tencent enterprise email is delivered to their mail server but blocked internally by corporate IT policy — outside our control. A custom domain with SPF/DKIM may help marginally but is not guaranteed. Tracked under [[DEV-003 Custom Domain]].
