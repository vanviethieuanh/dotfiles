#!/bin/sh

REPO_DIR="${REPO_DIR:-$HOME/Repositories}"
MAX_DEPTH="${REPO_MENU_DEPTH:-4}"

if [ ! -d "$REPO_DIR" ]; then
    exit 0
fi

if ! command -v rg >/dev/null 2>&1; then
    printf '%s\n' "list-repos.sh: rg is required but was not found in PATH" >&2
    exit 0
fi

echo '#'
rg --files --hidden --no-messages --no-ignore -g '**/.git/HEAD' --max-depth "$MAX_DEPTH" "$REPO_DIR" |
    sed "s|^$REPO_DIR/||; s|/\.git/HEAD$||" |
    sort
