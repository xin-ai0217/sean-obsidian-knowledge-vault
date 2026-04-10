---
id: DEV-018
status: Planned
priority: 🔴 High
created: 2026-04-10
completed:
---

# DEV-018 — Multi-Platform Recruitment Architecture

**What:** Redesign the recruitment layer so Dolphin is a platform-agnostic participant pool. Researchers never see Prolific, Respondent, or any external platform — they just see Dolphin's pool. Under the hood, Dolphin routes campaigns across multiple platforms via adapters.

---

## Core principles agreed

- **Dolphin owns the filter schema** — researchers interact with Dolphin's canonical filters only. No platform terminology, IDs, or quirks ever surface in the UI.
- **Platforms are interchangeable adapters** — each adapter translates Dolphin's criteria into that platform's API format. Adding a new platform = write one adapter + one capability registry entry. Zero UI changes.
- **Form is always fast** — no live API calls on form open. Filter options come from Dolphin's own static canonical schema.
- **Async resolution at estimate time** — all platform API calls happen when researcher clicks "Get estimate", the one moment they already expect to wait.
- **Research integrity guaranteed** — a platform only gets traffic if it can honour every filter. No silent skipping.

---

## Workflow

### Form opens (zero API calls)
Renders instantly from Dolphin's own static canonical schema. Countries, ethnicity options, education levels etc. are all defined by Dolphin — not fetched from any platform.

### Researcher clicks "Get estimate"
Three steps happen async:

**1. Capability check (static, instant)**
Dolphin checks which platforms support ALL selected filters from its capability registry:
```
Prolific:    age ✓  gender ✓  country ✓  ethnicity ✓  education ✓  employment ✓  language ✓
Respondent:  age ✓  gender ✓  country ✓  ethnicity ✗  education ✓
```
Platforms that don't support a selected filter are immediately eliminated. No API call needed.

**2. ID resolution (async, cached 1hr)**
For each eligible platform, its adapter fetches the platform's live filter list and resolves Dolphin labels → platform IDs. Two-layer resolution:
- Primary: exact filter ID match
- Fallback: keyword scan of filter titles → **alert fires to admin if fallback is used**
- Verification: compare resolved label against platform's label to confirm correct match
- If neither resolves → platform dropped from this campaign

**3. Eligibility + cost (async, parallel)**
For each platform that passed resolution, fire in parallel:
- Eligibility count with resolved filter IDs → pool size
- Cost estimate

Aggregate across all platforms. Researcher sees one number: "~550 people available · ~$470 total"

### Researcher clicks "Pay & recruit"
Dolphin criteria stored in Stripe checkout metadata. Nothing platform-specific stored at this point.

### Payment completes (webhook)
- Re-run capability check
- For each eligible platform: call its adapter, translate criteria, launch campaign
- Save each platform's campaign ID to DB
- Researcher sees one unified session list — sessions internally tagged by platform source but never exposed

---

## Alerting on keyword fallback

When `resolveFilterDef()` falls back to keyword matching (meaning a platform changed a filter ID):
- Send alert to admin immediately (email or Slack)
- Include: platform name, filter key, expected ID, matched ID, matched title
- Admin verifies the match is correct, updates `FILTER_REGISTRY` primary ID
- Worst case: 1hr exposure window before update (within one cache cycle)

---

## Capability registry reconciliation job

**Problem:** If a platform gains a new filter (e.g. Respondent adds ethnicity), we'd never know — we always drop Respondent for ethnicity-filtered campaigns based on current registry.

**Fix:** Weekly background job that:
1. Fetches live filter list from each platform
2. Compares against capability registry
3. Flags any filters present on the platform but not in our registry
4. Sends alert to admin: "Respondent now appears to support ethnicity — verify and update registry if confirmed"

A human confirms, updates the registry. Respondent then automatically starts receiving ethnicity-filtered traffic.

---

## What needs to change in existing code

- [ ] Define `DOLPHIN_FILTER_SCHEMA` — Dolphin's own canonical static filter definitions (options for country, ethnicity, education etc. owned by us)
- [ ] Define `PLATFORM_CAPABILITY_REGISTRY` — static map of which filters each platform supports
- [ ] Remove `GET /api/prolific/filters` call from `RecruitParticipants.tsx` on mount
- [ ] Update form to render from `DOLPHIN_FILTER_SCHEMA` instead of API response
- [ ] Refactor `lib/prolific.ts` into a proper adapter (`lib/platforms/prolific.ts`)
- [ ] Create adapter interface (`lib/platforms/types.ts`) that all platform adapters implement
- [ ] Move capability check + ID resolution + eligibility into estimate route
- [ ] Add real alerting (email to admin) when keyword fallback fires
- [ ] Build weekly reconciliation job to detect new platform capabilities
- [ ] Create `lib/platforms/respondent.ts` adapter when Respondent is onboarded

---

## What stays the same

- Two-layer ID resolution (primary ID + keyword fallback) — already built in `lib/prolific.ts`, just moves into the Prolific adapter
- 1hr raw filter cache — stays, just scoped per adapter
- `RecruitmentCriteria` interface — this becomes Dolphin's canonical criteria format
- Stripe checkout + webhook flow — unchanged
- Double-spend guard — unchanged
