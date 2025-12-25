#!/bin/bash

THEME=$1
VARIANT=$2

BASEDIR="$HOME/.config/themes"
THEMEDIR="$BASEDIR/$THEME"

CONF_FILE="$HOME/.config/i3/colors.conf"

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
  source "$THEMEDIR/$VARIANT.sh"
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi

sed -i "s/^\(set \$color_background \)#[0-9a-fA-F]\{6\}/\1$COLOR_BACKGROUND/" $CONF_FILE
sed -i "s/^\(set \$color_background_alt \)#[0-9a-fA-F]\{6\}/\1$COLOR_BACKGROUND_ALT/" $CONF_FILE
sed -i "s/^\(set \$color_foreground \)#[0-9a-fA-F]\{6\}/\1$COLOR_FOREGROUND/" $CONF_FILE
sed -i "s/^\(set \$color_primary \)#[0-9a-fA-F]\{6\}/\1$COLOR_PRIMARY/" $CONF_FILE
sed -i "s/^\(set \$color_secondary \)#[0-9a-fA-F]\{6\}/\1$COLOR_SECONDARY/" $CONF_FILE
sed -i "s/^\(set \$color_tertiary \)#[0-9a-fA-F]\{6\}/\1$COLOR_TERTIARY/" $CONF_FILE
sed -i "s/^\(set \$color_disabled \)#[0-9a-fA-F]\{6\}/\1$COLOR_DISABLED/" $CONF_FILE
sed -i "s/^\(set \$color_active \)#[0-9a-fA-F]\{6\}/\1$COLOR_ACTIVE/" $CONF_FILE
sed -i "s/^\(set \$color_urgent \)#[0-9a-fA-F]\{6\}/\1$COLOR_URGENT/" $CONF_FILE

i3-msg reload >/dev/null
