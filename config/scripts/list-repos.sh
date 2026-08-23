#!/bin/sh

REPO_DIR="${REPO_DIR:-$HOME/Repositories}"
MAX_DEPTH="${REPO_MENU_DEPTH:-4}"

if [ ! -d "$REPO_DIR" ]; then
  exit 0
fi

rg --files --hidden --no-messages -g '**/.git/HEAD' --max-depth "$MAX_DEPTH" "$REPO_DIR" \
  | sed "s|^$REPO_DIR/||; s|/\.git/HEAD$||" \
  | sort
