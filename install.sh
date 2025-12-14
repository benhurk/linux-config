#!/bin/bash

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Installing core..."
sudo apt install -y \
  xorg xinput mesa-utils \
  network-manager bluez pipewire-audio libnotify-bin \
  zsh build-essential curl vim gh unzip pipx fastfetch \
  kitty i3-wm picom polybar rofi feh lightdm slick-greeter dunst xsct flameshot

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable lightdm

log "Enabling flatpak..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Running Nix installer..."
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon

log "Changing shell..."
chsh -s /usr/bin/zsh

log "Done! Run 'sudo reboot' to restart."
