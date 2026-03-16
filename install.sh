#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for dir in "$SCRIPT_DIR"/*/; do
  if [[ -f "$dir/install.sh" ]]; then
    echo "==> $(basename "$dir")"
    bash "$dir/install.sh"
  fi
done
