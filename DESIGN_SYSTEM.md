# Panels Design System

Sharp, flat, AI-native aesthetic.

## Quick Reference

### Colors

| Token | Usage |
|-------|-------|
| `--color-bg` | Page background |
| `--color-surface` | Cards, containers |
| `--color-surface-muted` | Alternating sections, hover states |
| `--color-text` | Primary text |
| `--color-text-muted` | Secondary text, captions |
| `--color-border` | Dividers, card borders |
| `--color-accent` | CTAs, links, interactive elements |
| `--color-accent-hover` | Hover state for accent |
| `--color-success` | Success messages, positive states |
| `--color-warning` | Warning messages |
| `--color-error` | Error messages, destructive actions |

### Radius

| Token | Value | Usage |
|-------|-------|-------|
| `--radius-sm` | 2px | Buttons, inputs, small elements |
| `--radius-md` | 4px | Cards, containers |
| `--radius-lg` | 6px | Modals, large elements |
| `--radius-full` | 9999px | Avatars, pills, tags |

### Typography

| Token | Size | Usage |
|-------|------|-------|
| `--text-xs` | 12px | Captions, labels, fine print |
| `--text-sm` | 14px | UI text, body small |
| `--text-base` | 16px | Body default |
| `--text-lg` | 18px | Body large, lead text |
| `--text-xl` | 20px | Section headers |
| `--text-2xl` | 24px | Page headers |
| `--text-3xl` | 32px | Hero subhead |
| `--text-4xl` | 40px | Hero headline |
| `--text-5xl` | 48px | Large hero |

## Component Patterns

### Buttons

```html
<!-- Primary -->
<button class="bg-[--color-accent] hover:bg-[--color-accent-hover] text-white px-4 py-2 rounded-[--radius-sm] text-sm font-medium transition-colors">
  Get Started
</button>

<!-- Secondary -->
<button class="border border-[--color-border] hover:border-[--color-text-muted] text-[--color-text] px-4 py-2 rounded-[--radius-sm] text-sm font-medium transition-colors">
  Learn More
</button>

<!-- Ghost -->
<button class="text-[--color-text-muted] hover:text-[--color-text] px-4 py-2 text-sm font-medium transition-colors">
  Cancel
</button>
```

### Cards

```html
<div class="bg-[--color-surface] border border-[--color-border] rounded-[--radius-md] p-6">
  <h3 class="text-[--text-lg] font-semibold text-[--color-text]">Card Title</h3>
  <p class="text-[--color-text-muted] mt-2">Card description text.</p>
</div>
```

### Section

```html
<section class="py-24 px-6">
  <div class="max-w-7xl mx-auto">
    <h2 class="text-[--text-3xl] font-semibold text-[--color-text]">Section Title</h2>
    <p class="text-[--color-text-muted] mt-4 max-w-2xl">Section description.</p>
  </div>
</section>

<!-- Muted background variant -->
<section class="py-24 px-6 bg-[--color-surface-muted]">
  ...
</section>
```

### Inputs

```html
<input
  type="text"
  class="w-full bg-[--color-surface] border border-[--color-border] rounded-[--radius-sm] px-3 py-2 text-[--color-text] placeholder:text-[--color-text-muted] focus:border-[--color-accent] focus:outline-none"
  placeholder="Enter text..."
/>
```

## Icons

Using [Phosphor Icons](https://phosphoricons.com) with regular weight (default).

```html
<!-- Via CDN (add to <head>) -->
<script src="https://unpkg.com/@phosphor-icons/web"></script>

<!-- Usage -->
<i class="ph ph-arrow-right"></i>
<i class="ph ph-check"></i>
<i class="ph ph-x"></i>

<!-- With sizing -->
<i class="ph ph-arrow-right text-xl"></i>
```

Common icons:
- Navigation: `ph-arrow-right`, `ph-arrow-left`, `ph-caret-down`
- Actions: `ph-check`, `ph-x`, `ph-plus`, `ph-minus`
- UI: `ph-sun`, `ph-moon`, `ph-gear`, `ph-user`
- Data: `ph-chart-line`, `ph-table`, `ph-database`
- AI: `ph-sparkle`, `ph-robot`, `ph-lightning`

## Logo (Temporary)

Text-based logo until proper logo is designed:

```html
<a href="/" class="text-xl font-semibold text-[--color-text]">
  Panels
</a>
```

## Dark Mode Toggle

The system uses `data-theme` attribute on `<html>`:

```html
<html data-theme="light">  <!-- Force light -->
<html data-theme="dark">   <!-- Force dark -->
<html>                     <!-- System preference -->
```

Toggle script:
```javascript
function setTheme(theme) {
  if (theme === 'system') {
    document.documentElement.removeAttribute('data-theme');
    localStorage.removeItem('theme');
  } else {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
  }
}

// On page load
const saved = localStorage.getItem('theme');
if (saved) document.documentElement.setAttribute('data-theme', saved);
```
