---
id: BUG-002
severity: 🟡 Sev 2 — Nice to fix
status: Open
opened: 2026-04-09
fixed:
linked-task: —
---

# BUG-002 — Possible Missing Suspense Boundary

**Symptom:** Not confirmed yet. `useSearchParams` was removed from `RecruitParticipants` (now uses a `payment` prop instead). But other client components inside campaign pages may still use hooks that require a `<Suspense>` wrapper in Next.js App Router.

**Risk:** If triggered, Next.js would throw an error at build time or show a hydration warning in the console.

**Fix:** Audit all client components inside `/campaign/` pages. Wrap any that call `useSearchParams()` in `<Suspense fallback={null}>`.
