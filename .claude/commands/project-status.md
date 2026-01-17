# Project Status

Provide a comprehensive overview of the current project state.

## Data Collection

Run these commands to gather project state (execute in parallel where possible):

### GitHub Issues
```bash
gh issue list --limit 20 --json number,title,labels,state,createdAt,updatedAt --jq '.[] | "\(.number)\t\(.state)\t\(.labels | map(.name) | join(","))\t\(.title)"'
```

### Active Worktrees
```bash
git worktree list
```

### Current Branch & Status
```bash
git branch --show-current
git status --short
```

### Recent Merges (last 10)
```bash
git log --oneline --merges -10
```

### Recent Commits (last 10)
```bash
git log --oneline -10
```

### Open PRs
```bash
gh pr list --limit 10 --json number,title,state,headRefName --jq '.[] | "#\(.number)\t\(.headRefName)\t\(.title)"'
```

## Output Format

Compile the data into this dashboard format:

```markdown
# 📊 Project Status: panels-website

**Generated:** [timestamp]
**Branch:** [current branch]
**Working Directory:** [clean/dirty]

---

## 🔧 Active Work

### Worktrees
| Path | Branch | Status |
|------|--------|--------|
| ../panels-website-issue-5 | issue-5 | [active] |
| (none) | - | No active worktrees |

### Open PRs
| PR | Branch | Title |
|----|--------|-------|
| #12 | feature-x | Add feature X |
| (none) | - | No open PRs |

---

## 📋 Issues by Priority

### 🔴 P0 - Critical (Launch Blockers)
| # | Title | Type |
|---|-------|------|
| 1 | Landing Page | page |

### 🟠 P1 - High Priority
| # | Title | Type |
|---|-------|------|
| 4 | Comparison Pages | content |

### 🟡 P2 - Medium Priority
| # | Title | Type |
|---|-------|------|
| 7 | Legal Pages | page |

### 📦 Untagged
| # | Title |
|---|-------|
| 99 | Some issue |

---

## 📜 Recent Activity

### Last 5 Merges
| Commit | Message |
|--------|---------|
| abc123 | Merge issue-5 |

### Last 5 Commits
| Commit | Message |
|--------|---------|
| def456 | feat: Add landing page |

---

## 📈 Summary

- **Open Issues:** X total (Y P0, Z P1)
- **Active Worktrees:** X
- **Open PRs:** X
```

## Analysis

After presenting the dashboard, provide brief insights:

1. **Current Focus:** What issues are actively being worked on?
2. **Blockers:** Any P0 issues not yet started?
3. **Suggested Next:** Based on priorities, what should be tackled next?

## Priority Detection

Parse issue labels to identify priority:
- `P0` → Critical (launch blockers)
- `P1` → High priority
- `P2` → Medium priority
- `page` → Page/route work
- `content` → Blog/content work
- `infra` → Infrastructure/tooling

Group issues by priority and highlight P0 issues first.
