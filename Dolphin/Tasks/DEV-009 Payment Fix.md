---
id: DEV-009
status: Done
priority: 🔴 Critical
created: 2026-04-09
completed: 2026-04-09
---

# DEV-009 — Payment Completion Page Fix

**What:** After paying via Stripe, users were landing on a broken page. Root cause: `NEXT_PUBLIC_APP_URL` in `.env.local` was set to the production Vercel URL, so local test payments redirected to production after checkout.

**Fix:** Changed `.env.local` to `http://localhost:3000`. Production Vercel env var stays as the real domain.
