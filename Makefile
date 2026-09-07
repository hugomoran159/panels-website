# taskctl runs `make dev` when a task's runtime comes up; keep the real
# commands in package.json.
.PHONY: dev build preview
dev:
	pnpm dev
build:
	pnpm build
preview:
	pnpm preview
