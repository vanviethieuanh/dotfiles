#!/bin/sh

REPO_DIR="$HOME/Repositories"
CHOSEN=$(
  {
    echo "#"
    find "$REPO_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort
  } | vicinae dmenu --placeholder "Select repository"
)

[ -z "$CHOSEN" ] && exit 1

if [ "$CHOSEN" = "#" ]; then
  foot
  exit 0
fi

~/.config/scripts/open-repo-session.sh $CHOSEN
