#!/usr/bin/env bash

source "$HOME/scripts/polybar/env.sh"

POWERED=$(bluetoothctl show | grep "Powered: yes" | wc -l)

show() {
  if [ "$POWERED" -eq 0 ]; then
    echo "%{F$COLOR_DISABLED}󰂲%{F-}"
  else
    echo "%{F$COLOR_PRIMARY}%{F-}"
  fi
}

toggle() {
  if [ "$POWERED" -eq 0 ]; then
    bluetoothctl power on
  else
    bluetoothctl power off
  fi

  polybar-msg action "#bluetooth.hook.0"
}

case "$1" in
toggle) toggle ;;
show | *) show ;;
esac
