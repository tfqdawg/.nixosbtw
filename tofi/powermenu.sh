#!/usr/bin/env bash

killall -q tofi

choice=$(printf "%s\n" "Sleep" "Restart" "Power Off" | tofi --prompt-text "Power" --width 280 --height 170)

case "$choice" in
	"Sleep") systemctl suspend ;;
	"Restart") systemctl reboot ;;
	"Power Off") systemctl poweroff ;;
esac
