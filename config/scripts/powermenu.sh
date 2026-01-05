#!/bin/sh

CHOSEN=$(rofi -dmenu -i -config ~/.config/rofi/shutdown.rasi <<EOF
Reboot
Shutdown
Log Out
EOF
)

case "$CHOSEN" in
    "Reboot")
        reboot
        ;;
    "Shutdown")
        poweroff
        ;;
    "Log Out")
        hyprctl dispatch exit
        ;;
    *)
        exit 1
        ;;
esac
