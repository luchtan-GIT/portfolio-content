#!/bin/bash
# Publish vault notes to portfolio site.
# Run this from anywhere — it always operates on the public/ folder.

cd "$(dirname "$0")"

if [[ -z $(git status --porcelain) ]]; then
  echo "Nothing to publish."
  exit 0
fi

BRANCH="publish-$(date +%Y%m%d-%H%M%S)"
git checkout -b "$BRANCH"
git add .
git commit -m "update content"
git checkout main
git merge "$BRANCH"
git branch -d "$BRANCH"
git push
echo "Published."
