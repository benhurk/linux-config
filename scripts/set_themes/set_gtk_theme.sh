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

if [ $VARIANT == "dark" ]; then
  cp "$THEMEDIR/gtk-dark.css" "$HOME/.config/gtk-3.0/colorscheme.css"
  cp "$THEMEDIR/gtk-dark.css" "$HOME/.config/gtk-4.0/colorscheme.css"
  $THEMEDIR/set_folders.sh dark
elif [ $VARIANT == "light" ]; then
  cp "$THEMEDIR/gtk-light.css" "$HOME/.config/gtk-3.0/colorscheme.css"
  cp "$THEMEDIR/gtk-light.css" "$HOME/.config/gtk-4.0/colorscheme.css"
  $THEMEDIR/set_folders.sh light
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi
