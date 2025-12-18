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
curl -O -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono/
rm JetBrainsMono.zip

curl -O -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts/NerdFontsSymbolsOnly/
rm NerdFontsSymbolsOnly.zip

fc-cache -f -v

log "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

log "Linking config files and scripts..."

link ~/linux-config/config/i3 ~/.config/i3
link ~/linux-config/config/picom ~/.config/picom
link ~/linux-config/config/polybar ~/.config/polybar
link ~/linux-config/config/rofi ~/.config/rofi
link ~/linux-config/config/kitty ~/.config/kitty
link ~/linux-config/config/.zshrc ~/.zshrc
link ~/linux-config/scripts ~/scripts

log "Done! Restart i3 with Super + Shift + R."
