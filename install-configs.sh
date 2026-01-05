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

log "Instalando ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

log "Criando links das configs e scripts..."
link ~/linux-config/config/sway ~/.config/sway
link ~/linux-config/config/waybar ~/.config/waybar
link ~/linux-config/config/rofi ~/.config/rofi
link ~/linux-config/config/kitty ~/.config/kitty
link ~/linux-config/config/nvim ~/.config/nvim
link ~/linux-config/config/dunst ~/.config/dunst
link ~/linux-config/config/gtk-3.0 ~/.config/gtk-3.0
link ~/linux-config/config/gtk-4.0 ~/.config/gtk-4.0
link ~/linux-config/config/themes ~/.config/themes
link ~/linux-config/config/.zshrc ~/.zshrc
link ~/linux-config/scripts ~/scripts

log "Pronto."
