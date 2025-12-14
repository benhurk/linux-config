#!/bin/bash

source "$HOME/scripts/polybar/env.sh"

if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo "%{F$COLOR_DISABLED}%{F-}"
elif [ $(bluetoothctl devices Connected | wc -l) -gt 0 ]; then
  echo "%{F$COLOR_ACTIVE}%{F-}"
else
  echo "%{F$COLOR_PRIMARY}%{F-}"
fi
