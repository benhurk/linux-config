#!/usr/bin/env bash
set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Linking config and theme files..."

if [ ! -d "$HOME/linux-config" ]; then
  git clone https://github.com/benhurk/linux-config.git "$HOME/linux-config"
fi

ln -sf ~/linux-config/config/i3 ~/.config/i3
ln -sf ~/linux-config/config/picom ~/.config/picom
ln -sf ~/linux-config/config/polybar ~/.config/polybar
ln -sf ~/linux-config/config/rofi ~/.config/rofi
ln -sf ~/linux-config/config/kitty ~/.config/kitty
ln -sf ~/linux-config/config/.zshrc ~/.zshrc
ln -sf ~/linux-config/fonts ~/.local/share/fonts
ln -sf ~/linux-config/theme/mouse-cursors ~/.icons
ln -sf ~/linux-config/theme/icons ~/.local/share/icons
ln -sf ~/linux-config/theme/wallpapers ~/Imagens/wallpapers

log "Done! Refresh i3 with Super + Shift + R and reopen applications."
