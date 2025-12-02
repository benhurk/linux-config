#!/usr/bin/env bash

APT_UPDATES=$(apt list --upgradable 2>/dev/null | grep -c "atualizável\|upgradable")
FLATPAK_UPDATES=$(flatpak remote-ls --updates 2>/dev/null | wc -l)
total=$((APT_UPDATES + FLATPAK_UPDATES))

if [ $total -gt 0 ]; then
  echo "$total"
fi
