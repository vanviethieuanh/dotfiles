#!/usr/bin/env bash
set -euo pipefail

tmp=$(mktemp /tmp/json.XXXXXX)

# Open your default editor (vim, nvim, nano, etc.)
"${EDITOR:-vi}" "$tmp"

formatted=$(jq . "$tmp")

printf '%s\n' "$formatted"
printf '%s' "$formatted" | pbcopy

rm -f "$tmp"
