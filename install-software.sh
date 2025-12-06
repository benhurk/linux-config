#!/usr/bin/env bash

sudo apt install -y \
  pavucontrol blueman lxappearance btop \
  vlc mpv steam

flatpak install -y \
  app.zen_browser.zen \
  com.heroicgameslauncher.hgl \
  org.gimp.GIMP \
  com.github.tchx84.Flatseal \
  com.bitwarden.desktop \
  org.qbittorrent.qBittorrent

echo "nvm (Install script from GitHub)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
