#!/bin/bash

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

link() {
  local src=$1
  local dest=$2
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    rm -rf "$dest"
  fi
  ln -sf "$src" "$dest"
}

log "Installing fonts..."
link ~/linux-config/fonts ~/.local/share/fonts
fc-cache -f -v

log "Linking config files and scripts..."

link ~/linux-config/config/i3 ~/.config/i3
link ~/linux-config/config/picom ~/.config/picom
link ~/linux-config/config/polybar ~/.config/polybar
link ~/linux-config/config/rofi ~/.config/rofi
link ~/linux-config/config/kitty ~/.config/kitty
link ~/linux-config/config/.zshrc ~/.zshrc
link ~/linux-config/scripts ~/scripts

log "Done! Restart i3 with Super + Shift + R."
