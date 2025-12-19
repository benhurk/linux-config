#!/usr/bin/env bash

source "$HOME/scripts/polybar/env.sh"

APT_UPDATES=$(apt list --upgradable 2>/dev/null | grep -c "atualizável\|upgradable")
FLATPAK_UPDATES=$(flatpak remote-ls --updates 2>/dev/null | wc -l)
TOTAL=$((APT_UPDATES + FLATPAK_UPDATES))

if [ $TOTAL -gt 0 ]; then
  echo "%{F$COLOR_SECONDARY T2}%{F- T-}"
else
  echo "%{F$COLOR_DISABLED T2}%{F- T-}"
fi
