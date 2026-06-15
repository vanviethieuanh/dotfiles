#!/bin/sh

REPO_DIR="$HOME/Repositories"
CHOSEN=$(
  {
    echo "#"
    find "$REPO_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort
  } | vicinae dmenu --placeholder "Select repository" --section-title "{count} repositories found."
)

[ -z "$CHOSEN" ] && exit 1

if [ "$CHOSEN" = "#" ]; then
  if tmux has-session -t "home" 2>/dev/null; then
    foot tmux attach-session -t "home"
  else
    foot tmux new-session -A -s "home"
  fi
  exit 0
fi

~/.config/scripts/open-repo-session.sh $CHOSEN
