#!/usr/bin/env bash
set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

link() {
  local src=$1
  local dest=$2
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    rm -rf "$dest"
  fi
  ln -sf "$src" "$dest"
  log "Linked $dest → $src"
}

log "Linking theme directories and files..."
link ~/linux-config/themes/mouse-cursors ~/.icons
link ~/linux-config/themes/icons ~/.local/share/icons
link ~/linux-config/themes/wallpapers ~/Imagens/wallpapers

log "Done! Refresh i3 with Super + Shift + R and reopen applications."
