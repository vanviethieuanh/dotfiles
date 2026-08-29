#!/bin/sh

REPO_DIR="$HOME/Repositories"
CHOSEN="$1"
[ -z "$CHOSEN" ] && exit 0

if [ "$CHOSEN" = "#" ]; then
    SESSION_NAME="home"
else
    TARGET="$REPO_DIR/$CHOSEN"
    SESSION_NAME="[repo] $CHOSEN"
fi

if ! tmux has-session -t "=$SESSION_NAME" 2>/dev/null; then
    if [ "$CHOSEN" = "#" ]; then
        tmux new-session -d -s "home"
    else
        tmux new-session -d -s "$SESSION_NAME" -c "$TARGET" -n NeoVim
        tmux send-keys -t "$SESSION_NAME:NeoVim" "nvim" Enter
        tmux new-window -t "$SESSION_NAME" -c "$TARGET" -n OpenCode
        tmux split-window -h -t "$SESSION_NAME:OpenCode" -p 70 -c "$TARGET"
        tmux send-keys -t "$SESSION_NAME:OpenCode.2" "opencode" Enter
    fi
fi

if [ -n "$TMUX" ] && tmux switch-client -t "=$SESSION_NAME" 2>/dev/null; then
    exit 0
fi

CLIENT=$(tmux list-clients -F '#{client_tty} #{client_flags}' 2>/dev/null |
    awk '/focused/{print $1; exit} {first=first?first:$1} END{if(first) print first}')

if [ -n "$CLIENT" ] && tmux switch-client -t "=$SESSION_NAME" -c "$CLIENT" 2>/dev/null; then
    exit 0
fi

foot tmux attach-session -t "=$SESSION_NAME"
