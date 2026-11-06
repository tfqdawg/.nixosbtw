#!/usr/bin/env bash

killall -q tofi

choice=$(printf "%s\n" "Sleep" "Reboot" "Shut Down" | tofi --prompt-text "Power" --width 300 --height 200)

case "$choice" in
  "Sleep") systemctl suspend ;;
  "Reboot") systemctl reboot ;;
  "Shut Down") systemctl poweroff ;;
esac
