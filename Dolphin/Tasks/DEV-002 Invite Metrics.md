---
id: DEV-002
status: In Progress
priority: 🟠 Medium
created: 2026-04-09
completed:
depends-on: DEV-001
---

# DEV-002 — Invite Metrics

**What:** After sending email invites, the researcher should see live stats at the top of the Direct campaign page: how many invited, how many clicked the link (opened but not finished), and how many completed. Stats refresh every 30 seconds automatically.

**How it works:**
- New `invites` DB table stores each email + a unique token
- Invite URL embeds `?inv=<token>`
- A click-tracking route sets `clicked_at` on load, then redirects to interview
- A session gets linked to the invite when the interview starts
- Frontend polls the stats endpoint every 30s

---

### Subtasks

- [ ] Run `0003_invites.sql` migration in Supabase dashboard
- [ ] Update invite API route to insert rows into `invites` table
- [ ] Embed `?inv=<token>` in invite email links
- [ ] Create `/api/invite/[token]/click` route (sets `clicked_at`, redirects)
- [ ] Build `/api/studies/[id]/invite-stats` endpoint
- [ ] Build `InviteMetrics` client component (30s polling heartbeat)
- [ ] Place metrics banner at top of Direct campaign page
