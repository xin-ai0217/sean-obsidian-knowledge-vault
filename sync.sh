#!/bin/bash
# Obsidian vault daily sync script
cd /root/.openclaw/workspace/obsidian-vault

# Pull latest changes first
git pull origin main 2>&1

# Check if there are changes to commit
if git diff --quiet && git diff --cached --quiet; then
    echo "No changes to sync"
else
    git add .
    git commit -m "Auto-sync $(date '+%Y-%m-%d %H:%M')"
    git push origin main 2>&1
fi
