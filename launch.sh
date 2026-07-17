#!/usr/bin/env bash

killall -q polybar

while pgrep -u "$UID" -x polybar >/dev/null; do
  sleep 0.2
done

export NET_IFACE="$(ip route | awk '/default/ {print $5; exit}')"
export BATTERY="$(ls /sys/class/power_supply 2>/dev/null | grep -m1 '^BAT' || echo BAT0)"
export ADAPTER="$(ls /sys/class/power_supply 2>/dev/null | grep -m1 '^A[CD]' || echo AC)"

polybar main -c "$HOME/.config/polybar/config.ini" 2>&1 | tee -a /tmp/polybar.log &
