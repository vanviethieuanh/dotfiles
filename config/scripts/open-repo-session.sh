#!/bin/sh

REPO_DIR="$HOME/Repositories"
CHOSEN="$1"

TARGET="$REPO_DIR/$CHOSEN"
SESSION_NAME="[repo] $CHOSEN"

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  tmux switch-client -t "$SESSION_NAME:1" 2>/dev/null || foot tmux attach-session -t "$SESSION_NAME"
  exit 0
fi

tmux new-session -d -s "$SESSION_NAME" -c "$TARGET" -n NeoVim
tmux send-keys -t "$SESSION_NAME:NeoVim" "nvim" Enter

tmux new-window -t "$SESSION_NAME" -c "$TARGET" -n OpenCode
tmux split-window -h -t "$SESSION_NAME:OpenCode" -p 70 -c "$TARGET"

tmux send-keys -t "$SESSION_NAME:OpenCode.2" "opencode" Enter

tmux switch-client -t "$SESSION_NAME:1" 2>/dev/null || foot tmux attach-session -t "$SESSION_NAME"
