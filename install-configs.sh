#!/bin/bash

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

if [ ! -d "~/.config" ]; then
  mkdir -p ~/.config
fi

link() {
  local src=$1
  local dest=$2
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    rm -rf "$dest"
  fi
  ln -sf "$src" "$dest"
}

log "Instalando ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

log "Criando links das configs e scripts..."

link ~/.repo/config/sway ~/.config/sway
link ~/.repo/config/waybar ~/.config/waybar
link ~/.repo/config/rofi ~/.config/rofi
link ~/.repo/config/kitty ~/.config/kitty
link ~/.repo/config/nvim ~/.config/nvim
link ~/.repo/config/dunst ~/.config/dunst
link ~/.repo/config/gtk-3.0 ~/.config/gtk-3.0
link ~/.repo/config/gtk-4.0 ~/.config/gtk-4.0
link ~/.repo/config/themes ~/.config/themes
link ~/.repo/config/.zshrc ~/.zshrc
link ~/.repo/scripts ~/scripts

log "Pronto."
