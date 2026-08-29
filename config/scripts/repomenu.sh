#!/bin/sh

REPO_DIR="$HOME/Repositories"
CHOSEN=$(
  {
    sh ~/.config/scripts/list-repos.sh
  } | vicinae dmenu --placeholder "Select repository" --section-title "{count} repositories found."
)

[ -z "$CHOSEN" ] && exit 1

~/.config/scripts/open-repo-session.sh "$CHOSEN"
