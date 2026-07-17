#!/usr/bin/env bash

chosen="$(printf '󰒲  Sleep\n󰍃  Logout\n󰜉  Reboot\n󰐥  Shutdown\n󰌾  Lock' | rofi -dmenu -i -p 'Power' -theme-str 'window {width: 18em;} listview {lines: 5;}')"

case "$chosen" in
  *Sleep*)    systemctl suspend ;;
  *Logout*)   i3-msg exit ;;
  *Reboot*)   systemctl reboot ;;
  *Shutdown*) systemctl poweroff ;;
  *Lock*)     loginctl lock-session ;;
esac
