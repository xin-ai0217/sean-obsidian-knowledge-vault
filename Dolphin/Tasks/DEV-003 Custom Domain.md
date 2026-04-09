---
id: DEV-003
status: Planned
priority: 🟠 Medium
created: 2026-04-09
completed:
unlocks: DEV-001
---

# DEV-003 — Custom Domain

**What:** Own and configure a domain (e.g. `dolphin-ai.com`) so that: (1) participants see a clean URL instead of `research-platform-ivory.vercel.app`, and (2) emails send from a professional address like `noreply@dolphin-ai.com`.

---

### Subtasks

- [ ] Pick and buy domain on Cloudflare Registrar (~$10/yr, no markup)
- [ ] Add custom domain in Vercel dashboard
- [ ] Point DNS A/CNAME records to Vercel
- [ ] Verify domain in email provider (Resend or SendGrid)
- [ ] Add SPF + DKIM DNS records for email
- [ ] Update `NEXT_PUBLIC_APP_URL` in Vercel env vars
