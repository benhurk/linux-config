#!/usr/bin/env bash
set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Linking config and theme files..."

if [ ! -d "$HOME/linux-config" ]; then
  git clone https://github.com/benhurk/linux-config.git "$HOME/linux-config"
fi

rm -rf ~/.config/i3
ln -s ~/linux-config/config/i3 ~/.config/i3
rm -rf ~/.config/picom
ln -s ~/linux-config/config/picom ~/.config/picom
rm -rf ~/.config/polybar
ln -s ~/linux-config/config/polybar ~/.config/polybar
rm -rf ~/.config/rofi
ln -s ~/linux-config/config/rofi ~/.config/rofi
rm -rf ~/.config/kitty
ln -s ~/linux-config/config/kitty ~/.config/kitty
rm -f ~/.zshrc
ln -s ~/linux-config/config/.zshrc ~/.zshrc

ln -s ~/linux-config/fonts ~/.local/share/fonts
ln -s ~/linux-config/theme/mouse-cursors ~/.icons
ln -s ~/linux-config/theme/icons ~/.local/share/icons
ln -s ~/linux-config/theme/wallpapers ~/Imagens/wallpapers

log "Done! Refresh i3 with Super + Shift + R."
