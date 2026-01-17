# Review Current Changes

Review all changes in the current worktree/branch compared to main.

## Pre-compute context (run first for efficiency):
```bash
git diff main --stat
git diff main --name-only
git log main..HEAD --oneline
git branch --show-current
```

## Review Process

Use the Task tool to spawn parallel review agents for comprehensive analysis:

### 1. Code Quality Review (Task: Explore agent)
Analyze the diff for:
- Astro component best practices
- TypeScript correctness
- Tailwind utility usage (no arbitrary values when tokens exist)
- Component organization and reusability
- Unnecessary complexity
- Proper imports and dependencies

### 2. Design System Compliance (Task: Explore agent)
For each modified file, check:
- Are design tokens used? (`--color-*`, `--radius-*`, `--space-*`)
- No hardcoded colors (should use `--color-text`, `--color-accent`, etc.)
- No hardcoded spacing (should use `--space-*` scale)
- Correct radius usage (`--radius-sm` for buttons, etc.)
- Phosphor icons used correctly
- Dark mode considered (using semantic tokens)

### 3. Accessibility & SEO Review (Task: Explore agent)
Scan for:
- Semantic HTML (`<nav>`, `<main>`, `<section>`, `<article>`)
- Proper heading hierarchy (h1 → h2 → h3, no skips)
- Alt text on images
- ARIA labels where needed
- Focus states on interactive elements
- Meta tags (title, description, OG tags)
- Link text is descriptive (not "click here")

## Output Format

Compile findings into a structured report:

```markdown
## Review Summary: [branch-name]

### Files Changed
- list of files

### ✅ Strengths
- What's done well

### ⚠️ Issues Found

#### Critical (must fix)
- Accessibility or build issues

#### Moderate (should fix)
- Design system violations

#### Minor (consider fixing)
- Style or preference issues

### 🎨 Design System Compliance
- Token usage assessment
- Dark mode compatibility

### ♿ Accessibility
- Semantic HTML check
- Keyboard navigation
- Screen reader considerations

### 🔍 SEO
- Meta tags
- Heading structure
- Image optimization

### Verdict
[ ] Ready to merge
[ ] Needs minor changes
[ ] Needs significant changes
```

IMPORTANT: Run all three review agents in parallel using a single message with multiple Task tool calls for efficiency.
