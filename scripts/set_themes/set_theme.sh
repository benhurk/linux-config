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
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi
