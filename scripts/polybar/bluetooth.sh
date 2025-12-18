#!/bin/bash

source "$HOME/scripts/polybar/env.sh"

if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo "%{F$COLOR_DISABLED}%{T2}%{T-} %{T1}Off%{T-}%{F-}"
elif [ $(bluetoothctl devices Connected | wc -l) -gt 0 ]; then
  echo "%{F$COLOR_ACTIVE}%{T2}%{T-} %{T1}Conectado%{T-}%{F-}"
else
  echo "%{F$COLOR_PRIMARY}%{T2}%{T-} %{T1}On%{T-}%{F-}"
fi
