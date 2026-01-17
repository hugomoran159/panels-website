# Work on GitHub Issue

Implement a complete solution for GitHub issue #$ARGUMENTS

## Phase 1: Setup

1. Fetch issue details:
```bash
gh issue view $ARGUMENTS
```

2. Create a dedicated worktree:
```bash
git worktree add ../panels-website-issue-$ARGUMENTS -b issue-$ARGUMENTS
```

3. Change to the worktree directory and confirm:
```bash
cd ../panels-website-issue-$ARGUMENTS && pwd
```

IMPORTANT: All subsequent work MUST happen in the worktree directory (`../panels-website-issue-$ARGUMENTS`), NOT the main repo.

## Phase 2: Plan

1. Analyze the issue requirements
2. Review the design system: `DESIGN_SYSTEM.md`
3. Explore existing components in `src/components/`
4. Create a clear implementation plan
5. Present the plan to the user for approval before coding

## Phase 3: Implement

1. Implement the solution following the approved plan
2. Follow the design system tokens (see `DESIGN_SYSTEM.md`)
3. Use Phosphor icons where needed
4. Build to verify: `pnpm build`
5. Test locally: `pnpm dev` (check in browser)

### Astro Guidelines
- Use `.astro` components for static content
- Keep JavaScript minimal (static-first)
- Use semantic HTML
- Follow existing component patterns

## Phase 4: Review

Run the review-changes command workflow:

1. Pre-compute context:
```bash
git diff main --stat
git diff main --name-only
```

2. Use the Task tool to spawn 3 PARALLEL review agents (in a single message):

   **Agent 1 - Code Quality:** Review Astro/TypeScript, component structure, Tailwind usage

   **Agent 2 - Design System Compliance:** Check tokens are used correctly, no hardcoded colors/spacing

   **Agent 3 - Accessibility & SEO:** Verify semantic HTML, alt texts, meta tags, heading hierarchy

3. Compile findings into a review report with:
   - ✅ Strengths
   - ⚠️ Issues (Critical / Moderate / Minor)
   - 📋 Design system compliance
   - Merge readiness verdict

## Phase 5: Approval Checkpoint

⏸️ **STOP AND WAIT FOR USER INPUT**

Present the review summary and ask:

"Review complete. Please respond with:
- **'approved'** - I'll merge to main and close the issue
- **'fix: [description]'** - I'll address the feedback and re-review
- **'abort'** - I'll clean up the worktree without merging"

### If user says "fix: ..." or requests changes:
1. Address the feedback
2. Re-run build
3. Return to Phase 4 (Review)

### If user says "approved":
Continue to Phase 6

### If user says "abort":
1. Return to main repo: `cd ../panels-website`
2. Remove worktree: `git worktree remove ../panels-website-issue-$ARGUMENTS`
3. Delete branch: `git branch -D issue-$ARGUMENTS`
4. Report cleanup complete and stop

## Phase 6: Finish

Execute the finish-issue workflow:

1. Commit all changes (if not already committed):
```bash
git add -A
git commit -m "$(cat <<'EOF'
feat: [Description from issue] (#$ARGUMENTS)

[Summary of changes]

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
EOF
)"
```

2. Switch to main and merge:
```bash
cd ../panels-website
git checkout main
git merge issue-$ARGUMENTS --no-ff -m "Merge branch 'issue-$ARGUMENTS' (#$ARGUMENTS)"
```

3. Clean up worktree and branch:
```bash
git worktree remove ../panels-website-issue-$ARGUMENTS
git branch -d issue-$ARGUMENTS
```

4. Close the GitHub issue:
```bash
gh issue close $ARGUMENTS --comment "Completed in $(git rev-parse --short HEAD)."
```

5. Report success with:
   - Merge commit hash
   - Issue URL
   - Summary of what was implemented
