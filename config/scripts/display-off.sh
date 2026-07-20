#!/bin/bash

pkill -f "display-off.sh" 2>/dev/null
sleep 3

hyprctl dispatch dpms off

LAST_POS=$(hyprctl cursorpos)
while true; do
    sleep 0.5
    CUR_POS=$(hyprctl cursorpos)
    if [ "$CUR_POS" != "$LAST_POS" ]; then
        hyprctl dispatch dpms on
        exit 0
    fi
done
