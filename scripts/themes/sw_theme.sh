#!/bin/bash

THEME=$1
VARIANT=$2

basedir="$HOME/.config/themes"
themedir="$basedir/$THEME"

if [ -z "$THEME" ] || [ -z "$VARIANT" ]; then
  echo "Usage: $(basename "$0") <theme> <variant>"
  echo "Example: $(basename "$0") catppuccin dark"
  exit 1
fi

if [ ! -d $basedir ]; then
  echo "Themes directory not found"
  exit 1
fi

if [ ! -d $themedir ]; then
  echo "Theme not available in $basedir"
  echo "Available themes:"
  ls $basedir
  exit 1
fi

if [ $VARIANT == "dark" ] || [ $VARIANT == "light" ]; then
  notify-send -i colors "Mudando tema..." "$THEME $VARIANT"

  # gtk and desktop colors
  $HOME/scripts/themes/sw_gtk_colors.sh $THEME $VARIANT
  $HOME/scripts/themes/sw_desktop_colors.sh $THEME $VARIANT

  # wallpaper
  wallpaper=$(cat $themedir/extras.ini | grep "default-wallpaper-$VARIANT" | awk -F '=' '{print $2}')
  wallpaper="${wallpaper/\~/$HOME}"
  $HOME/scripts/themes/sw_wallpaper.sh $wallpaper

  # terminal
  kitty_theme=$(cat $themedir/extras.ini | grep "kitty-theme" | awk -F '=' '{print $2}')
  kitten themes $kitty_theme

  # neovim
  nvim_theme=$(cat $themedir/extras.ini | grep "neovim-theme" | awk -F '=' '{print $2}')
  sed -i "s/colorscheme = \".*\"/colorscheme = \"$nvim_theme\"/" $HOME/.config/nvim/lua/plugins/colorscheme.lua
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi

swaymsg reload >/dev/null
