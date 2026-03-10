# Project Conventions & Directives

This document outlines the operational memory, global directives, and project
conventions for this repository. All automated agents and contributors MUST
adhere to these guidelines.

## Operational Memory

- `layouts/` -> Hugo HTML templates.
- `content/` -> Markdown content files.
- `update.sh` -> Codegen / updaters entrypoint script.
- `.github/workflows/` -> GitHub Actions workflows.

## Environment & Tooling

- **Setup:** The project uses `mise` for environment setup and task management.
  It is a non-negotiable basic necessity. `mise` MUST be used for all task
  execution.
- **Linting/Formatting:** The project uses `workspaced` for linting and
  formatting.
- **Tool Versions:** Tool versions in `mise.toml` and GitHub Actions (e.g.,
  `go`, `hugo`) MUST be explicitly pinned. 'latest' or 'lts' are not allowed.

### Key `mise` Tasks

- `lint`: runs `workspaced codebase lint`
- `fmt`: runs `workspaced codebase format`
- `test`: runs `hugo --minify`
- `codegen`: runs `./update.sh`
- `ci`: runs `mise run test`
- `install`: compiles `workspaced` from source

## Code Conventions

- **Centralized Error Reporting:** The project strictly requires centralized
  error reporting. No empty catch blocks or silent failures are allowed. All
  error handling paths MUST use a centralized error-reporting function. Scripts
  (like `update.sh`) use a centralized `reportError` function hooked via
  `trap ... ERR`.
- **Static Site Generator:** This is a Hugo static site project.

## CI/CD Workflow

- CI/CD is defined in GitHub Actions workflows (like
  `.github/workflows/autorelease.yml` and `gh-pages.yaml`).
- The enforced flow is: `install` -> `codegen` -> `PR` (if changes) -> `CI` ->
  `release` -> `artifacts` (GitHub Pages).
- **GitHub Actions Requirement:** In GitHub Actions workflows, the
  `create-pull-request` action requires
  `base: ${{ github.head_ref || github.ref_name }}` to handle `pull_request`
  events correctly without detached HEAD errors.

## Pull Request Guidelines

- Pull Requests MUST be titled exactly: `🛠️ Refactor: [Description]` (unless
  instructed otherwise by a specific active agent).
- Every PR body MUST include the following mandatory sections:
  - `Assumptions`
  - `Alternatives Not Chosen`
  - `How To Pivot`
  - `Next Knobs`
