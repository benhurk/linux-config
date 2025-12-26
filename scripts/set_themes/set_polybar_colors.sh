#!/bin/bash

THEME=$1
VARIANT=$2

BASEDIR="$HOME/.config/themes"
THEMEDIR="$BASEDIR/$THEME"

CONF_FILE="$HOME/scripts/polybar/env.sh"

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
  sed -i "s|COLORSCHEME_PATH=\"[^\"]*\"|COLORSCHEME_PATH=\"$THEMEDIR/$VARIANT.sh\"|" $CONF_FILE
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi

$HOME/scripts/polybar/launch.sh 2>/dev/null
