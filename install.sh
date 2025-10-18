#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[INFO]\033[0m $1"; }

sudo apt update -y && sudo apt upgrade -y

log "Enabling flatpak..."
sudo apt install -y flatpak && flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Installing essential packages..."
sudo apt install -y kitty zsh i3-wm picom polybar rofi feh git gh
