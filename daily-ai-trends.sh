#!/bin/bash
# Daily AI Trends fetcher — appends significant AI news to AI Trends.md
# Run at 7 AM Beijing time (23:00 UTC)

VAULT_DIR="/root/.openclaw/workspace/obsidian-vault"

cd "$VAULT_DIR" || exit 1

# Pull latest from GitHub first (uses stored credentials)
git pull origin main 2>/dev/null

# Fetch latest smol.ai issue
LATEST_ISSUE=$(curl -s "https://news.smol.ai/issues" | grep -oE 'href="/issues/[0-9]+-[0-9]+-[0-9]+-[^"]+"' | head -1 | sed 's|href="||;s|"||g')

if [ -z "$LATEST_ISSUE" ]; then
    echo "No issue found"
    exit 0
fi

ISSUE_URL="https://news.smol.ai${LATEST_ISSUE}"

# Fetch content
curl -s -A "Mozilla/5.0" "$ISSUE_URL" -o /tmp/smol_latest.html 2>/dev/null

# Note: actual parsing and decision-making done by the cron agent
# This script just pulls latest and lets the agent decide what to append

echo "Fetched latest from smol.ai"
echo "URL: $ISSUE_URL"

# Git operations use stored credential helper (git config --global credential.helper store)
# Token stored in: ~/.git-credentials (NOT in this repo)
