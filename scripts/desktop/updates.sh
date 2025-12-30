#!/bin/bash

log() { echo -e "\033[1;32m[$1]\033[0m"; }

apt_updates=$(apt list --upgradable | sed 1d)
flatpak_updates=$(flatpak remote-ls --updates)

log "apt"
if [ ! -z $apt_updates ]; then
  echo -e "$apt_updates\n"
else
  echo -e "Nenhuma atualização disponível\n"
fi

log "flatpak"
if [ ! -z $flatpak_updates ]; then
  echo -e "$flatpak_updates\n"
else
  echo -e "Nenhuma atualização disponível\n"
fi

update() {
  if [ ! -z $apt_updates ]; then
    sudo apt update && sudo apt upgrade -y
  fi

  if [ ! -z $flatpak_updates ]; then
    flatpak update -y
  fi

  polybar-msg cmd restart >/dev/null
}

if [ ! -z $apt_updates ] || [ ! -z $flatpak_updates ]; then
  read -p "Instalar atualizações? (y/n) " choice

  case "$choice" in
  y | Y) update ;;
  n | N) ;;
  *) ;;
  esac
fi
