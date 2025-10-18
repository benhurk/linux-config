#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Enabling flatpak..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Installing essential packages..."
sudo apt install -y \
  xorg xinit mesa-utils mesa-vulkan-drivers vulkan-tools alsa-utils pulseaudio pipewire \
  network-manager nmcli bluez \
  build-essential vim curl git gh unzip \
  kitty zsh i3-wm picom polybar rofi feh lightdm slick-greeter \
  fonts-dejavu fonts-noto-color-emoji

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sudo systemctl enable lightdm

log "Cloning and linking config files..."
if [ ! -d "$HOME/linux-config" ]; then
  git clone https://github.com/benhurk/linux-config.git "$HOME/linux-config"
fi

mkdir -p ~/.config/{i3,picom,polybar,rofi,kitty}

ln -sf ~/linux-config/config/i3/config ~/.config/i3/config
ln -sf ~/linux-config/config/picom/picom.conf ~/.config/picom/picom.conf
ln -sf ~/linux-config/config/polybar/config.ini ~/.config/polybar/config.ini
ln -sf ~/linux-config/config/rofi ~/.config/rofi
ln -sf ~/linux-config/config/kitty ~/.config/kitty
ln -sf ~/linux-config/config/.zshrc ~/.zshrc

log "Changing shell..."
chsh -s $(which zsh)

log "Finished! Reboot required."
