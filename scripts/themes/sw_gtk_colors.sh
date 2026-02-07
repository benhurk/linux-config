#!/bin/bash

THEME=$1
VARIANT=$2

basedir="$HOME/.config/themes"
themedir="$basedir/$THEME"

if [ -z "$THEME" ] || [ -z "$VARIANT" ]; then
  echo "Usage: $0 <theme> <variant>"
  echo "Example: $0 catppuccin dark"
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
  cp "$themedir/gtk-$VARIANT.css" "$HOME/.config/gtk-3.0/colorscheme.css"
  cp "$themedir/gtk-$VARIANT.css" "$HOME/.config/gtk-4.0/colorscheme.css"

  folders=$(cat $themedir/config | grep "folders-$VARIANT" | awk -F '=' '{print $2}')
  papirus-folders --color $folders >/dev/null
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi
