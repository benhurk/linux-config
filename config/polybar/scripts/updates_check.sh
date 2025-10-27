#!/usr/bin/env bash

COLOR_PRIMARY="#61afef"
COLOR_DISABLED="#abb2bf"

apt_updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
flatpak_updates=$(flatpak remote-ls --updates 2>/dev/null | wc -l)
total=$((apt_updates + flatpak_updates))

if [ $total -gt 0 ]; then
  echo "%{F$COLOR_PRIMARY T3}󰏔%{T-} $total%{F-}"
else
  echo "%{F$COLOR_DISABLED T3}󰏔%{T-} $total%{F-}"
fi
