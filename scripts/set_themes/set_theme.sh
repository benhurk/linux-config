#!/bin/bash

THEME=$1
VARIANT=$2

BASEDIR="$HOME/.config/themes"
THEMEDIR="$BASEDIR/$THEME"

if [ -z "$THEME" ] || [ -z "$VARIANT" ]; then
  echo "Usage: $0 <theme> <variant>"
  echo "Example: $0 catppuccin dark"
  exit 1
fi

if [ ! -d $BASEDIR ]; then
  echo "Themes directory not found"
  exit 1
fi

if [ ! -d $THEMEDIR ]; then
  echo "Theme not available in $BASEDIR"
  echo "Available themes:"
  ls $BASEDIR
  exit 1
fi

if [ $VARIANT == "dark" ] || [ $VARIANT == "light" ]; then
  notify-send "Mudando tema para $THEME $VARIANT..."

  $HOME/scripts/set_themes/set_gtk_theme.sh $THEME $VARIANT
  $HOME/scripts/set_themes/set_i3_colors.sh $THEME $VARIANT
  $HOME/scripts/set_themes/set_polybar_colors.sh $THEME $VARIANT
  $HOME/scripts/set_themes/set_rofi_colors.sh $THEME $VARIANT

  WALLPAPER=$(cat $THEMEDIR/extras.ini | grep "default-wallpaper-$VARIANT" | awk -F '=' '{print $2}')
  WALLPAPER="${WALLPAPER/\~/$HOME}"
  feh --bg-fill "$WALLPAPER"
  sed -i "s|^set \$wallpaper .*|set \$wallpaper $WALLPAPER|" $HOME/.config/i3/wallpaper.conf

  KITTY_THEME=$(cat $THEMEDIR/extras.ini | grep "kitty-theme" | awk -F '=' '{print $2}')
  kitten themes $KITTY_THEME

  NEOVIM_THEME=$(cat $THEMEDIR/extras.ini | grep "neovim-theme" | awk -F '=' '{print $2}')
  sed -i "s/colorscheme = \".*\"/colorscheme = \"$NEOVIM_THEME\"/" $HOME/.config/nvim/lua/plugins/colorscheme.lua
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi

i3-msg restart >/dev/null
notify-send "Tema alterado para $THEME $VARIANT"
