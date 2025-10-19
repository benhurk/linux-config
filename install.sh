#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Enabling flatpak..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Installing essential packages..."
sudo apt install -y \
  xorg xinit mesa-utils mesa-vulkan-drivers vulkan-tools alsa-utils pipewire \
  network-manager bluez \
  build-essential vim curl git gh unzip \
  kitty zsh i3-wm picom polybar rofi feh lightdm slick-greeter \
  fonts-dejavu fonts-noto-color-emoji

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable lightdm

log "Changing shell..."
sudo chsh -s "$(which zsh)" "$USER"

log "Done! Run 'sudo reboot' to restart."
