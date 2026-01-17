# Finish Issue

Merge current issue branch to main, clean up worktree, and close the GitHub issue.

Arguments: $ARGUMENTS (optional: issue number - will auto-detect from branch name if not provided)

## Pre-flight Checks

1. Detect current context:
```bash
pwd
git branch --show-current
git status --short
```

2. Extract issue number from branch name (if not provided):
   - Branch `issue-8` → issue number is `8`
   - If $ARGUMENTS provided, use that instead

3. Verify clean working state:
   - If uncommitted changes exist, prompt user to commit or stash first
   - If not on an issue branch, abort with helpful message

## Step 1: Build Verification

Ensure the build passes before merging:
```bash
pnpm build
```

If build fails, abort and report the error.

## Step 2: Commit (if needed)

If there are uncommitted changes:
```bash
git add -A
git commit -m "$(cat <<'EOF'
feat: Complete issue implementation (#ISSUE_NUMBER)

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
EOF
)"
```

## Step 3: Merge to Main

```bash
# Get the worktree directory and branch name
WORKTREE_DIR=$(pwd)
BRANCH_NAME=$(git branch --show-current)
ISSUE_NUM=[extracted or provided issue number]

# Switch to main repo and merge
cd ../panels-website
git checkout main
git pull origin main --ff-only 2>/dev/null || true
git merge $BRANCH_NAME --no-ff -m "Merge branch '$BRANCH_NAME' - closes #$ISSUE_NUM"
```

## Step 4: Cleanup

```bash
# Remove worktree
git worktree remove $WORKTREE_DIR

# Delete the branch
git branch -d $BRANCH_NAME
```

## Step 5: Close Issue

```bash
gh issue close $ISSUE_NUM --comment "Completed in $(git rev-parse --short HEAD)."
```

## Step 6: Report

Output a summary:
```
✅ Issue #[number] completed

- Merged: [branch] → main
- Commit: [short hash]
- Worktree removed: [path]
- Issue closed: [url]
```

## Error Handling

- **Not on issue branch:** "You're on '[branch]'. This command works from issue-* branches."
- **Uncommitted changes:** "You have uncommitted changes. Commit them first or use 'abort'."
- **Build fails:** "Build failed. Fix errors before finishing."
- **Merge conflict:** "Merge conflict detected. Resolve manually, then re-run."
- **Issue already closed:** Continue with cleanup, note issue was already closed.
