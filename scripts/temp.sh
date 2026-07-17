#!/usr/bin/env bash

temp="$(sensors 2>/dev/null | awk '/Package id 0|Tctl|Tccd1|temp1/ {
  gsub(/[+°C]/, "", $2);
  print $2;
  exit
}')"

if [ -z "$temp" ]; then
  echo "%{F#BF616A}󰸁%{F-} n/a"
  exit 0
fi

# Drop decimals for threshold checks
temp_int="${temp%%.*}"

if [ "$temp_int" -lt 50 ]; then
  icon="%{F#88C0D0}󰔏%{F-}"
elif [ "$temp_int" -lt 70 ]; then
  icon="%{F#A3BE8C}󰔏%{F-}"
elif [ "$temp_int" -lt 85 ]; then
  icon="%{F#EBCB8B}󰔐%{F-}"
else
  icon="%{F#BF616A}󰸁%{F-}"
fi

echo "${icon} ${temp}°C"
