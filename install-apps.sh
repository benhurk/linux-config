#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Installing apt apps..."
sudo apt install btop vlc lxappearance blueman steam

log "Installing Flatpak apps..."
flatpak install -y app.zen_browser.zen org.gimp.GIMP com.github.tchx84.Flatseal com.bitwarden.desktop
