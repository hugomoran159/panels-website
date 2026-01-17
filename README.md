# Panels Marketing Website

Marketing website for [Panels](https://panels.dev) - the self-hosted Notion for data teams.

## Tech Stack

- **Framework:** [Astro 5](https://astro.build) (static site generation)
- **Styling:** [Tailwind CSS 4](https://tailwindcss.com)
- **Icons:** [Phosphor Icons](https://phosphoricons.com)
- **Package Manager:** pnpm

## Getting Started

```bash
# Install dependencies
pnpm install

# Start dev server (localhost:4321)
pnpm dev

# Build for production
pnpm build

# Preview production build
pnpm preview
```

## Project Structure

```
├── public/              # Static assets (copied as-is)
├── src/
│   ├── components/      # Reusable UI components
│   ├── layouts/         # Page layouts
│   ├── pages/           # Routes (file-based routing)
│   ├── content/         # MDX content (blog posts)
│   └── styles/
│       ├── global.css
│       └── design-system.css
├── DESIGN_SYSTEM.md     # Design system reference
└── astro.config.mjs
```

## Design System

See [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md) for tokens, component patterns, and usage guidelines.

Key principles:
- Sharp, flat aesthetic (2px corners, no shadows)
- Light/dark mode with system default
- Indigo accent color
- Phosphor icons (regular weight)

## Deployment

Deployed via Cloudflare Pages. Pushes to `main` deploy automatically.
