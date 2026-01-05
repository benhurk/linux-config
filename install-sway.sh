#!/bin/bash

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Installing SwayFX build dependencies..."
sudo apt update && sudo apt install -y \
  meson pkg-config cmake git scdoc \
  wayland-protocols libwayland-dev libpcre2-dev libjson-c-dev \
  libpango1.0-dev libcairo2-dev libgdk-pixbuf-2.0-dev \
  libdrm-dev libgbm-dev libinput-dev libseat-dev libxkbcommon-dev \
  libxcb-dri3-dev libxcb-present-dev libxcb-res0-dev \
  libxcb-render-util0-dev libxcb-ewmh-dev libxcb-icccm4-dev \
  libliftoff-dev libdisplay-info-dev liblcms2-dev libpixman-1-dev

log "Building SwayFX from source..."
mkdir -p ~/build
cd ~/build

git clone https://github.com/WillPower3309/swayfx.git
cd swayfx
git checkout 0.5.3

mkdir subprojects
cd subprojects

git clone https://github.com/wlrfx/scenefx.git
cd scenefx
git checkout 0.4.1
cd ..

git clone https://gitlab.freedesktop.org/wlroots/wlroots.git
cd wlroots
git checkout 0.19.0

cd ../..

meson setup build/
ninja -C build/
sudo ninja -C build/ install
sudo ldconfig

cd ~

log "Installing core..."
sudo apt install -y \
  swaybg swayidle xwayland \
  network-manager bluez pipewire-audio libnotify-bin mesa-utils \
  zsh build-essential curl vim unzip jq slurp \
  waybar kitty rofi dunst fastfetch

# wlprop (xprop alternative for wayland)
curl -L https://gist.github.com/crispyricepc/f313386043395ff06570e02af2d9a8e0/raw/8b06f025a0f34685f5ffc2000fd19a64754c9b29/wlprop.sh >~/.local/bin/wlprop
chmod +x ~/.local/bin/wlprop

# enable services
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth

log "Enabling flatpak..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Running Nix installer..."
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon

log "Changing shell..."
chsh -s /usr/bin/zsh

log "Done! Run 'sudo reboot' to restart."
