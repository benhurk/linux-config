#!/bin/bash

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Instalando fontes..."
if [ ! -d "~/.local/share/fonts" ]; then
  mkdir -p ~/.local/share/fonts
fi

curl -O -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono/
rm JetBrainsMono.zip

curl -O -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts/NerdFontsSymbolsOnly/
rm NerdFontsSymbolsOnly.zip

fc-cache -f -v

log "Instalando tema GTK..."
if [ ! -d "~/.themes" ]; then
  mkdir -p ~/.themes
fi

curl -O -L https://github.com/lassekongo83/adw-gtk3/releases/download/v6.4/adw-gtk3v6.4.tar.xz
tar -xf adw-gtk3v6.4.tar.xz -C ~/.themes/
rm adw-gtk3v6.4.tar.xz

log "Instalando tema de ícones..."
if [ ! -d "~/.icons" ]; then
  mkdir -p ~/.icons
fi

wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.icons" sh
wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh

git clone https://github.com/catppuccin/papirus-folders.git
cp -r papirus-folders/src/* ~/.icons/Papirus
rm -rf papirus-folders
git clone https://github.com/xelser/gruvbox-papirus-folders
cp -r gruvbox-papirus-folders/src/* ~/.icons/Papirus/
rm -rf gruvbox-papirus-folders

log "Instalando temas de cursor..."
git clone https://github.com/benhurk/Simp1e-Cursors.git
tar -xf Simp1e-Cursors/Simp1e-All.tar.xz -C ~/.icons/
rm -rf Simp1e-Cursors/

log "Pronto."
