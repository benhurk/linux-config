#!/usr/bin/env bash
set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Linking config and theme files..."

if [ ! -d "$HOME/linux-config" ]; then
  git clone https://github.com/benhurk/linux-config.git "$HOME/linux-config"
fi

mkdir -p ~/.config
mkdir -p ~/.local/share/fonts
mkdir -p ~/.local/share/icons
mkdir -p ~/.icons
mkdir -p ~/Imagens/wallpapers

link() {
  src="$1"
  dest="$2"
  if [ -L "$dest" ] || [ -e "$dest" ]; then
    rm -rf "$dest"
  fi
  ln -s "$src" "$dest"
}

# Config links
link ~/linux-config/config/i3 ~/.config/i3
link ~/linux-config/config/picom ~/.config/picom
link ~/linux-config/config/polybar ~/.config/polybar
link ~/linux-config/config/rofi ~/.config/rofi
link ~/linux-config/config/kitty ~/.config/kitty
link ~/linux-config/config/.zshrc ~/.zshrc
link ~/linux-config/theme/mouse-cursors ~/.icons
link ~/linux-config/theme/icons ~/.local/share/icons
link ~/linux-config/theme/wallpapers ~/Imagens/wallpapers
link ~/linux-config/fonts ~/.local/share/fonts

fc-cache -fv

log "Applying theme..."

log "Done! Refresh i3 with Super + Shift + R."
