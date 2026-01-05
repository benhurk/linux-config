#!/bin/bash

apt_updates=$(apt list --upgradable 2>/dev/null | grep "atualizável\|upgradable" | wc -l)
flatpak_updates=$(flatpak remote-ls --updates 2>/dev/null | wc -l)
total=$(($apt_updates + $flatpak_updates))

if [ $total -gt 0 ]; then
  echo " $total"
else
  echo " 󰄭"
fi
