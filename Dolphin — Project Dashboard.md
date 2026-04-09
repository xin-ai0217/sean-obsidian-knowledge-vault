# 🐬 Dolphin AI — Project Dashboard
*Last updated: 2026-04-09*

---

## 🚦 Status Overview

| Area | Status | Owner | Notes |
|------|--------|-------|-------|
| Core interview flow | ✅ Done | | Audio, AI turns, skip, TTS |
| Study creation & questions | ✅ Done | | AI generation, probing levels, duration |
| Auth & dashboard | ✅ Done | | Clerk, studies list, study detail |
| Landing page | ✅ Done | | Sign in/up, workflow illustration |
| Email invites | 🔄 In Progress | | Switching Resend → SendGrid; need domain |
| Campaign architecture | 🔄 In Progress | | Direct + Prolific campaigns, unified pages |
| Invite metrics | 📋 Planned | | Invites table, click tracking, heartbeat UI |
| Payment flow | ✅ Done | | Stripe, success redirect to campaign page |
| Prolific campaign dashboard | ✅ Done | | Status, pause/resume, session list |
| Audio storage cleanup | ✅ Done | | Deep delete, unified sessions/{id}/turns/ path |
| Reports & transcripts | ✅ Done | | Per-session AI summary, quotes, sentiment |

---

## 🔥 Active — In Progress

### `[DEV-001]` Email deliverability fix
- **Priority:** High
- **Status:** 🔄 In Progress
- **Context:** Resend `onboarding@resend.dev` only delivers to verified Resend account emails. Chinese enterprise emails (tencent.com etc) silently dropped. Codex switching to SendGrid with personal verified sender as stopgap.
- **Proper fix:** Buy domain → verify DNS on Resend/SendGrid → use `noreply@yourdomain.com`
- **Blockers:** Need to purchase domain
- [ ] Codex: replace Resend with SendGrid, use personal verified sender
- [ ] Buy domain (Cloudflare Registrar recommended, ~$10/yr)
- [ ] Add domain to Vercel (replace `research-platform-ivory.vercel.app`)
- [ ] Verify domain DNS on email provider
- [ ] Update `RESEND_FROM_EMAIL` env var in Vercel dashboard
- [ ] Test delivery to Gmail + Tencent enterprise email

### `[DEV-002]` Invite metrics + live tracking
- **Priority:** High
- **Status:** 📋 Planned
- **Context:** After sending invites, researcher needs to see: how many invited, how many clicked the link, how many completed. Needs heartbeat/polling to stay live.
- [ ] Run `0003_invites.sql` migration in Supabase
- [ ] Update invite API route to save to `invites` table
- [ ] Add `?inv=<token>` param to invite links
- [ ] Track click via `/api/invite/[token]/click` route that sets `clicked_at` and redirects to interview
- [ ] Add invite metrics API endpoint (`GET /api/studies/[id]/invite-stats`)
- [ ] Build `InviteMetrics` client component with 30s polling heartbeat
- [ ] Embed metrics at top of Direct campaign page

---

## 📋 Backlog

### `[DEV-003]` Custom domain setup
- **Priority:** Medium
- **Status:** 📋 Backlog
- **Notes:** Needed for professional email sender + clean URL. Unlocks both email deliverability and branded participant experience.
- [ ] Purchase domain
- [ ] Configure DNS on Cloudflare
- [ ] Add custom domain in Vercel dashboard
- [ ] Verify domain in Resend or SendGrid
- [ ] Update all `NEXT_PUBLIC_APP_URL` references

### `[DEV-004]` Participant portal (`/participate`)
- **Priority:** Medium
- **Status:** 📋 Backlog
- **Notes:** Landing page for participants to find more studies. Currently `/` (landing page) used as fallback after interview completion. Should be a dedicated page.
- [ ] Design participant-facing homepage
- [ ] Show available studies (public, active)
- [ ] Add "earn money" framing for Prolific-style participants

### `[DEV-005]` Suspense wrapper for `RecruitParticipants`
- **Priority:** Low
- **Status:** 📋 Backlog
- **Notes:** `useSearchParams()` was removed (now uses `payment` prop), but worth double-checking if any remaining client components inside Prolific campaign page need Suspense boundaries.
- [ ] Audit client components inside campaign pages
- [ ] Add `<Suspense>` where needed

### `[DEV-006]` Researcher analytics
- **Priority:** Low
- **Status:** 📋 Backlog
- **Notes:** Aggregate view across all studies. Total participants, avg completion rate, avg duration, top themes across reports.
- [ ] Design analytics page (`/analytics`)
- [ ] Aggregate sessions + reports data
- [ ] Charts: completion rate over time, avg duration per study

### `[DEV-007]` Prolific campaign — modify on the fly
- **Priority:** Low
- **Status:** 📋 Backlog
- **Notes:** Prolific API supports updating places and reward on a live study. Researcher should be able to bump sample size or reward without creating a new campaign.
- [ ] Add PATCH endpoint that calls Prolific `/studies/{id}/` with updated fields
- [ ] Build UI in campaign dashboard (editable slots + reward)
- [ ] Handle billing delta (charge difference via new Stripe session)

---

## ✅ Recently Completed

| Date | Item |
|------|------|
| 2026-04-09 | Unified campaign architecture: study page → Direct / Prolific campaign pages |
| 2026-04-09 | Removed sessions section from study page (now lives in campaign pages) |
| 2026-04-09 | Stripe redirect → `/campaign/prolific` (not study page) |
| 2026-04-09 | Prolific campaign page: live metrics, progress bar, pause/resume |
| 2026-04-09 | Payment completion page fix (`NEXT_PUBLIC_APP_URL` env var) |
| 2026-04-09 | AI interviewer: time pacing, study context, off-topic handling |
| 2026-04-09 | Deep delete: audio files cleaned up on study delete |
| 2026-04-09 | Audio storage unified under `sessions/{id}/turns/` |
| 2026-04-09 | Study questions: per-question probing levels (none/light/deep) |
| 2026-04-09 | 3-dot dropdown: rename, duplicate, delete with confirmation modal |
| 2026-04-09 | Landing page with workflow illustration and use cases |

---

## 🏗 Architecture Notes

### Navigation hierarchy
```
/                          Landing page (public)
/studies                   Study list (auth)
/studies/[id]              Study detail: questions + campaign cards
/studies/[id]/campaign/direct     Direct campaign: link, email, sessions
/studies/[id]/campaign/prolific   Pool campaign: setup → live metrics
/studies/[id]/sessions/[sid]      Session report
/i/[token]                 Interview room (public, participant-facing)
```

### Key env vars
```
NEXT_PUBLIC_APP_URL        http://localhost:3000 (local) | https://yourdomain.com (prod)
CLERK_SECRET_KEY           Auth
NEXT_PUBLIC_SUPABASE_URL   DB
PROLIFIC_API_KEY           Recruitment pool
STRIPE_SECRET_KEY          Payments
RESEND_API_KEY             Email (→ being replaced with SendGrid)
DEEPGRAM_API_KEY           TTS + ASR
MINIMAX_API_KEY            LLM chat
```

### Tech stack
- **Framework:** Next.js App Router (server + client components)
- **Auth:** Clerk
- **DB:** Supabase (Postgres + Storage)
- **AI:** MiniMax (chat), Deepgram (TTS/ASR)
- **Payments:** Stripe
- **Recruitment:** Prolific API
- **Email:** Resend → SendGrid (in migration)
- **Deployment:** Vercel

---

## 🐛 Known Issues / Bugs

| ID | Description | Severity | Status |
|----|-------------|----------|--------|
| BUG-001 | Email invites fail for non-Gmail (Tencent etc) — sender restriction | High | 🔄 Fix in progress |
| BUG-002 | `RecruitParticipants` bare mode cancel button clears wrong URL params | Low | 📋 Open |

---

*To add a new issue: copy an existing block, increment the ID, set status to 📋 Planned*
