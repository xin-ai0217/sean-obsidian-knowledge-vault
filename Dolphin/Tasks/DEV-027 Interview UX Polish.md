# DEV-027 Interview UX Polish

## Status
Done

## Summary
Cleaned up the interview start and completion screens.

## Changes

### Start Screen
- Removed name and email input fields entirely
- Backend validation updated: `participant_name` and `participant_email` now optional (no longer 400 error)
- API sends `null` for both fields
- AI greeting falls back to "Hi there!" when no name is provided (was hardcoded to require a name)

### Completion Screen
- Removed `→` arrow from "Find more studies" button
- Renamed button to "Explore more studies"
- Added "You're all done — feel free to close this page." line below thank you message
