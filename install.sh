#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Enabling flatpak..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Installing essentials..."
sudo apt install -y \
  xorg xinit mesa-utils mesa-vulkan-drivers vulkan-tools alsa-utils pipewire \
  network-manager bluez \
  zsh build-essential vim curl git gh unzip pipx \
  kitty i3-wm picom polybar rofi feh lightdm slick-greeter dunst redshift

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable lightdm

log "Installing fonts..."
rm -rf ~/.local/share/fonts
ln -sf ~/linux-config/fonts ~/.local/share/fonts
sudo apt install -y fonts-dejavu fonts-noto-color-emoji
fc-cache -vf

log "Changing shell..."
sudo chsh -s "$(which zsh)" "$USER"

log "Done! Run 'sudo reboot' to restart."
