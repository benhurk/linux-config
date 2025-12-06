#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Enabling flatpak..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Installing core..."
sudo apt install -y \
  xorg xinput mesa-utils \
  network-manager bluez pipewire-audio libnotify-bin \
  zsh build-essential curl git gh unzip pipx fastfetch \
  kitty i3-wm picom polybar rofi feh lightdm slick-greeter dunst xsct

echo "Installing Neovim (AppImage)..."
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim
echo "export PATH="$PATH:/opt/nvim/"" >>~/.zshrc
echo "export PATH="$PATH:/opt/nvim/"" >>~/.bashrc

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable lightdm

log "Changing shell..."
chsh -s /usr/bin/zsh

log "Done! Run 'sudo reboot' to restart."
