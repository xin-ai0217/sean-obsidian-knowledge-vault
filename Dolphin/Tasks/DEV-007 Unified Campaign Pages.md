---
id: DEV-007
status: Done
priority: 🔴 Critical
created: 2026-04-09
completed: 2026-04-09
---

# DEV-007 — Unified Campaign Pages

**What:** Restructured the navigation to be `studies → study detail → campaign pages`. Study detail now shows two campaign cards (Direct + Prolific). Sessions moved out of study detail and into their respective campaign pages.

**Result:** `/studies/[id]/campaign/direct` and `/studies/[id]/campaign/prolific` are fully separate pages. Stripe payment redirects to `/campaign/prolific` after checkout.
