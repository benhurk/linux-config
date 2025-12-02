#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[$1]\033[0m"; }

APT_UPDATES=$(apt list --upgradable)
FLATPAK_UPDATES=$(flatpak remote-ls --updates)
APT_TOTAL=$(printf "%s" "$APT_UPDATES" 2>/dev/null | grep -c "atualizável\|upgradable")
FLATPAK_TOTAL=$($FLATPAK_UPDATES 2>/dev/null | wc -l)

log "apt"
if [ $APT_TOTAL -gt 0 ]; then
  echo -e "$APT_UPDATES\n"
else
  echo -e "0\n"
fi

log "flatpak"
if [ $FLATPAK_TOTAL -gt 0 ]; then
  echo -e "$FLATPAK_UPDATES\n"
else
  echo -e "0\n"
fi

update() {
  if [ $APT_TOTAL -gt 0 ]; then
    sudo apt update && sudo apt upgrade -y
  fi

  if [ $FLATPAK_TOTAL -gt 0 ]; then
    flatpak update -y
  fi

  polybar-msg cmd restart >/dev/null
}

if [ $((APT_TOTAL + FLATPAK_TOTAL)) -gt 0 ]; then
  read -p "Atualizar? (y/n) " choice

  case "$choice" in
  y | Y) update ;;
  n | N) ;;
  *) ;;
  esac
fi
