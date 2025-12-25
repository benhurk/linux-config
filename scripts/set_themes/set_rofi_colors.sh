#!/bin/bash

THEME=$1
VARIANT=$2

BASEDIR="$HOME/.config/themes"
THEMEDIR="$BASEDIR/$THEME"

CONF_FILE="$HOME/.config/rofi/colorscheme.rasi"

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

sed -i "s/background: #[0-9a-fA-F]\{8\}/background: "$COLOR_BACKGROUND"D9/" $CONF_FILE
sed -i "s/background-alt: #[0-9a-fA-F]\{6\}/background-alt: $COLOR_BACKGROUND_ALT/" $CONF_FILE
sed -i "s/foreground: #[0-9a-fA-F]\{6\}/foreground: $COLOR_FOREGROUND/" $CONF_FILE
sed -i "s/selected: #[0-9a-fA-F]\{6\}/selected: $COLOR_PRIMARY/" $CONF_FILE
sed -i "s/secondary: #[0-9a-fA-F]\{6\}/secondary: $COLOR_SECONDARY/" $CONF_FILE
sed -i "s/tertiary: #[0-9a-fA-F]\{6\}/tertiary: $COLOR_TERTIARY/" $CONF_FILE
sed -i "s/disabled: #[0-9a-fA-F]\{6\}/disabled: $COLOR_DISABLED/" $CONF_FILE
sed -i "s/active: #[0-9a-fA-F]\{6\}/active: $COLOR_ACTIVE/" $CONF_FILE
sed -i "s/urgent: #[0-9a-fA-F]\{6\}/urgent: $COLOR_URGENT/" $CONF_FILE
