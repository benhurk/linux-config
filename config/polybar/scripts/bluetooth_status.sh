#!/usr/bin/env bash

COLOR_PRIMARY=#61afef
COLOR_ACTIVE=#90bf85
COLOR_DISABLED=#abb2bf

if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo "%{F$COLOR_DISABLED}%{T3}󰂲%{T-} Off%{F-}"
else
  if [ $(bluetoothctl devices Connected | wc -l) -gt 0 ]; then
    echo "%{F$COLOR_PRIMARY}%{T3}󰂱%{T-}%{F-} %{F$COLOR_ACTIVE}Conectado%{F-}"
  else
    echo "%{F$COLOR_PRIMARY}%{T3}%{T-}%{F-} On"
  fi
fi
