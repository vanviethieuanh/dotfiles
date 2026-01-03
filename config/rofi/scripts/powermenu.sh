#!/bin/sh

CHOSEN=$(printf "Reboot\nShutdown\nLog Out" | rofi -dmenu -i -config ~/.config/rofi/shutdown.rasi)

case "$CHOSEN" in
	"Reboot") reboot ;;
	"Shutdown") poweroff ;;
	"Log Out") hyprctl dispatch exit ;;
	*) exit 1 ;;
esac
