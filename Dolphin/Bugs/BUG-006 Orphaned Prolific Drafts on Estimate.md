---
tags: bug
status: fixed
severity: medium
area: recruitment
---

# BUG-006 Orphaned Prolific Drafts on Estimate

## Summary
Every time a researcher clicked "Get estimate", `estimate/route.ts` called `createDraftCampaign` inside `Promise.all` but the result was silently discarded. The draft was created on Prolific but the `draftId`/`draftUrl` were never returned to the client or shown in the UI.

## Impact
- Orphaned unpublished drafts accumulate on the researcher's Prolific workspace with every estimate click
- No way for researcher to find or clean them up
- "Preview draft" feature was effectively broken — UI showed no link

## Root Cause
Codex introduced the draft creation into the estimate flow but only destructured 2 values from the 3-element `Promise.all`:
```ts
// Before (buggy)
const [rawCostUsd, eligibleCount] = await Promise.all([
  withRetry(() => prolificAdapter.estimateCost(criteria)),
  withRetry(() => prolificAdapter.checkEligibility(criteria)),
  createDraftCampaign(...),  // result discarded
]);
```

## Fix
Captured the third element and returned `draftId`/`draftUrl` in the API response. Updated `RecruitParticipants.tsx` to store and display the draft link after estimate.

```ts
// After (fixed)
const [rawCostUsd, eligibleCount, draft] = await Promise.all([...]);
return NextResponse.json({ ..., draftId: draft.draftId, draftUrl: draft.draftUrl });
```

## Fixed in
`app/api/studies/[id]/recruit/estimate/route.ts` and `components/dashboard/RecruitParticipants.tsx`
