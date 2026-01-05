#!/bin/bash

sudo apt install -y \
  pavucontrol blueman btop \
  mpv qbittorrent steam

flatpak install -y \
  app.zen_browser.zen \
  com.heroicgameslauncher.hgl \
  com.github.tchx84.Flatseal \
  com.bitwarden.desktop

nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.nodePackages_latest.nodejs
