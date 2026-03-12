#!/usr/bin/env bash

set -e
set -o pipefail

reportError() {
  local line=$1
  local cmd=$2
  echo "::error file=$0,line=$line::Command '$cmd' failed"
  exit 1
}

trap 'reportError ${LINENO} "$BASH_COMMAND"' ERR

files=$(find . -executable -type f | grep update_ | grep -v "update.sh" || true)
if [ -n "$files" ]; then
  for item in $files; do
    echo "Running $item"
    "$item"
  done
fi
