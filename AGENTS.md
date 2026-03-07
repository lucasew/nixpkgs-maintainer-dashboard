# Project Conventions

## General Guidelines
- **Centralized Error Reporting:** All expected or unexpected errors in scripts and code paths must funnel through a centralized reporting function. Do not leave empty catch blocks or swallow errors.
- **Tooling:** Use `mise` for environment setup, task management, linting, and formatting. Tool versions in `mise.toml` (e.g., `go`, `hugo`) must be explicitly pinned. Latest or LTS are not actual versions.
- **Continuous Integration:** `.github/workflows/gh-pages.yaml` (and similar workflows) enforce a flow of install -> codegen -> PR (if changes) -> CI -> release -> artifacts (GitHub Pages).
- **PR Automation:** The `create-pull-request` action requires `base: ${{ github.head_ref || github.ref_name }}` to handle `pull_request` events correctly without detached HEAD errors.

## Operational Memory (Project Structure)
- `hugo.toml` -> Hugo website configuration.
- `layouts/` -> Hugo templates for pages and shortcodes.
- `content/` -> Markdown and content files for the static site.
- `update.sh` -> Codegen and update scripts entrypoint.
- `.github/workflows/` -> CI/CD pipelines (GitHub Pages deployment).
- `mise.toml` -> Pinned tooling versions and task definitions (e.g. `test`, `codegen`, `lint`).
