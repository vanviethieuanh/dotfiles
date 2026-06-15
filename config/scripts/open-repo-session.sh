#!/bin/sh

REPO_DIR="$HOME/Repositories"
CHOSEN="$1"

TARGET="$REPO_DIR/$CHOSEN"
SESSION_NAME="[repo] $CHOSEN"

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  foot tmux attach-session -t "$SESSION_NAME"
  exit 0
fi

tmux new-session -d -s "$SESSION_NAME" -c "$TARGET" -n nvim
tmux send-keys -t "$SESSION_NAME:nvim" "nvim" Enter

tmux new-window -t "$SESSION_NAME" -c "$TARGET" -n term
tmux split-window -h -t "$SESSION_NAME:term" -p 30 -c "$TARGET"
tmux split-window -v -t "$SESSION_NAME:term.1" -p 20 -c "$TARGET"

tmux send-keys -t "$SESSION_NAME:term.1" "lazygit" Enter
tmux send-keys -t "$SESSION_NAME:term.3" "opencode" Enter

foot tmux attach-session -t "$SESSION_NAME"
