---
id: BUG-001
severity: 🟡 Sev 2 — Nice to fix
status: Partially fixed
opened: 2026-04-09
fixed:
linked-task: "[[DEV-001 Email Fix]]"
---

# BUG-001 — Email Invites Fail for Non-Gmail

**Symptom:** Researcher sends invites to 3 emails. Gmail receives it. Two Tencent enterprise emails get nothing — not even in spam.

**Root cause (original):** Sender was `onboarding@resend.dev`, a shared Resend sandbox address that can only deliver to verified Resend account emails. Fixed by switching to SendGrid with single sender verification.

**Remaining issue:** Tencent enterprise email is delivered to Tencent's mail server but blocked internally by their corporate IT security policy before reaching the recipient. This is outside our control — it is a recipient-side firewall decision, not a sender reputation problem.

**Partial fix applied:** SendGrid + personal verified sender. Gmail and most personal emails now work fine.

**Permanent fix:** Custom domain with SPF/DKIM/DMARC records may improve trust score enough to pass some enterprise filters, but Tencent's internal policy may still block external senders regardless. See [[DEV-001 Email Fix]].
