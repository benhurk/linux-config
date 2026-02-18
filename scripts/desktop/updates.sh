#!/bin/bash

log() { echo -e "\033[1;32m$1\033[0m"; }

apt_updates=$(apt list --upgradable 2>/dev/null | grep "atualizável\|upgradable")
flatpak_updates=$(flatpak remote-ls --updates)

log "[  apt ]"
if [ ! -z "$apt_updates" ]; then
  echo -e "$apt_updates\n"
else
  echo -e "Nenhuma atualização disponível\n"
fi

log "[  Flatpak ]"
if [ ! -z "$flatpak_updates" ]; then
  echo -e "$flatpak_updates\n"
else
  echo -e "Nenhuma atualização disponível\n"
fi

update_apt() {
  if [ ! -z "$apt_updates" ]; then
    sudo apt upgrade -y
  fi
}

update_flatpak() {
  if [ ! -z "$flatpak_updates" ]; then
    flatpak update -y
  fi
}

update_all() {
  update_apt
  update_flatpak
}

if [ ! -z "$apt_updates" ] || [ ! -z "$flatpak_updates" ]; then
  log "######\n"

  echo "Opções:"
  echo -e "[1] Tudo | [2] apt | [3] Flatpak | [0] Cancelar\n"

  read -p "Atualizar: " choice

  case "$choice" in
  "1") update_all ;;
  "2") update_apt ;;
  "3") update_flatpak ;;
  "0" | *) exit ;;
  esac
fi

pkill -RTMIN+1 waybar
