#!/bin/bash

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

log "Installing core..."
sudo apt install -y \
    sway swaybg swayidle xdg-desktop-portal-wlr autotiling xwayland libnotify-bin lxpolkit \
    pipewire-audio pamixer build-essential \
    network-manager bluez bluez-tools wireguard ufw resolvconf \
    zsh ripgrep curl wget pipx vim  mesa-utils unzip jq slurp python3-venv \
    waybar kitty rofi sway-notification-center gammastep fastfetch

# wlprop (xprop alternative for wayland)
curl -L https://gist.github.com/crispyricepc/f313386043395ff06570e02af2d9a8e0/raw/8b06f025a0f34685f5ffc2000fd19a64754c9b29/wlprop.sh >~/.local/bin/wlprop
chmod +x ~/.local/bin/wlprop

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# enable services
sudo ufw enable
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth

# enable 32-bit libraries (required for some apps like steam)
sudo dpkg --add-architecture i386
sudo apt update

log "Enabling flatpak..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Changing shell..."
chsh -s /usr/bin/zsh

log "Done! Run 'sudo reboot' to restart."
