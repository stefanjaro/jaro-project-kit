#!/usr/bin/env bash
set -euo pipefail

project_dir="${1:-.}"

if [[ ! -d "$project_dir" ]]; then
  printf 'Project folder does not exist: %s\n' "$project_dir" >&2
  exit 1
fi

project_dir="$(cd "$project_dir" && pwd)"
printf 'Installing Impeccable for Codex in %s\n' "$project_dir"

cd "$project_dir"
npx --yes skills@latest add pbakaus/impeccable --agent codex --skill '*' --yes
