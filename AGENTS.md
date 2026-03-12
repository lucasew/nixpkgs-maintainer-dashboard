# Project Conventions and Guidelines

## Directory Mapping
* `layouts/` -> Hugo HTML templates
* `content/` -> Markdown content files
* `update.sh` -> Codegen / updaters entrypoint script
* `.github/workflows/` -> GitHub Actions workflows

## Rules
* **No `latest` or `lts` Versions**: Always pin tools (`hugo`, `go`, etc.) and GitHub Actions to specific versions. "latest" and "lts" are not allowed as they lead to unpredictable builds.
* **Centralized Error Handling**: Scripts and code paths must use a centralized error reporting mechanism. Empty catch blocks or silent failures are strictly forbidden. Scripts like `update.sh` use a centralized `reportError` function hooked via `trap ... ERR`.
* **GitHub Actions Base Ref**: In GitHub Actions using `create-pull-request` (e.g. `gh-pages.yaml`), always pass `base: ${{ github.head_ref || github.ref_name }}` to handle `pull_request` events correctly and prevent detached HEAD errors.
* **Mise Tasks**: The project uses `mise` for environment setup and task management. Use `mise run lint`, `mise run test`, `mise run ci`, `mise run codegen` as standard entries.

## PR Standards
* **Refactor PRs**: Pull Requests must be titled exactly '🛠️ Refactor: [Description]'.
* **PR Sections**: Include mandatory sections in PR descriptions: 'Assumptions', 'Alternatives Not Chosen', 'How To Pivot', and 'Next Knobs'.
