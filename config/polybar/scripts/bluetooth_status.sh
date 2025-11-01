#!/usr/bin/env bash

COLOR_PRIMARY=#61afef
COLOR_SECONDARY=#ffb86c
COLOR_ACTIVE=#90bf85

if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo "%{F$COLOR_SECONDARY}󰂲%{F-}"
else
  if [ $(bluetoothctl devices Connected | wc -l) -gt 0 ]; then
    echo "%{F$COLOR_ACTIVE}󰂱%{F-}"
  else
    echo "%{F$COLOR_PRIMARY}󰂯%{F-}"
  fi
fi
