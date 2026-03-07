#!/usr/bin/env bash
set -e

reportError() {
  local exit_code=$?
  echo "Error occurred in update.sh at line ${1:-$LINENO}. Exit code: $exit_code." >&2
  exit $exit_code
}

trap 'reportError ${LINENO}' ERR

for item in $(find -executable -type f | grep update_); do
  echo Running "$item"
  $item
done
