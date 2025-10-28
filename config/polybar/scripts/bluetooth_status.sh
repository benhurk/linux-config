#!/usr/bin/env bash

COLOR_PRIMARY=#61afef
COLOR_SECONDARY=#ffb86c
COLOR_ACTIVE=#90bf85
COLOR_DISABLED=#abb2bf

if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo "%{F$COLOR_SECONDARY}%{T3}󰂲%{T-}%{F-} %{F$COLOR_DISABLED}Off%{F-}"
else
  if [ $(bluetoothctl devices Connected | wc -l) -gt 0 ]; then
    echo "%{F$COLOR_ACTIVE}%{T3}󰂱%{T-}%{F-} Conectado"
  else
    echo "%{F$COLOR_PRIMARY}%{T3}%{T-}%{F-} On"
  fi
fi
