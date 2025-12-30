#!/bin/bash

source "$HOME/.config/polybar/scripts/env.sh"

apt_updates=$(apt list --upgradable 2>/dev/null | grep "atualizável\|upgradable")
flatpak_updates=$(flatpak remote-ls --updates 2>/dev/null)

if [ ! -z $apt_updates ] || [ ! -z $flatpak_updates ]; then
  echo "%{F$COLOR_SECONDARY T2}%{F- T-}"
else
  echo "%{F$COLOR_DISABLED T2}%{F- T-}"
fi
