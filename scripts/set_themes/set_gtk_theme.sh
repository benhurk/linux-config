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
  cp "$THEMEDIR/gtk-$VARIANT.css" "$HOME/.config/gtk-3.0/colorscheme.css"
  cp "$THEMEDIR/gtk-$VARIANT.css" "$HOME/.config/gtk-4.0/colorscheme.css"

  FOLDERS=$(cat $THEMEDIR/extras.ini | grep "folders-$VARIANT" | awk -F '=' '{print $2}')
  papirus-folders --color $FOLDERS >/dev/null

  CURSOR=$(cat $THEMEDIR/extras.ini | grep "mouse-cursor" | awk -F '=' '{print $2}')
  sed -i "s/^gtk-cursor-theme-name=.*/gtk-cursor-theme-name=$CURSOR/" $HOME/.config/gtk-3.0/settings.ini
  sed -i "s/^gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"$CURSOR\"/" $HOME/.gtkrc-2.0
  sed -i "s/^Inherits=.*/Inherits=$CURSOR/" $HOME/.icons/default/index.theme
  sed -i "s/^Xcursor.theme: .*/Xcursor.theme: $CURSOR/" $HOME/.Xresources
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi
