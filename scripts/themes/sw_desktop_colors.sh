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
  source "$themedir/$VARIANT.sh"
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi

# i3
i3_conf_file="$HOME/.config/i3/colors.conf"

sed -i "s/^\(set \$color_background \).*/\1$COLOR_BACKGROUND/" $i3_conf_file
sed -i "s/^\(set \$color_background_alt \).*/\1$COLOR_BACKGROUND_ALT/" $i3_conf_file
sed -i "s/^\(set \$color_foreground \).*/\1$COLOR_FOREGROUND/" $i3_conf_file
sed -i "s/^\(set \$color_primary \).*/\1$COLOR_PRIMARY/" $i3_conf_file
sed -i "s/^\(set \$color_secondary \).*/\1$COLOR_SECONDARY/" $i3_conf_file
sed -i "s/^\(set \$color_tertiary \).*/\1$COLOR_TERTIARY/" $i3_conf_file
sed -i "s/^\(set \$color_disabled \).*/\1$COLOR_DISABLED/" $i3_conf_file
sed -i "s/^\(set \$color_active \).*/\1$COLOR_ACTIVE/" $i3_conf_file
sed -i "s/^\(set \$color_urgent \).*/\1$COLOR_URGENT/" $i3_conf_file

# polybar
polybar_env="$HOME/.config/polybar/scripts/env.sh"

sed -i "s|COLORSCHEME_PATH=\"[^\"]*\"|COLORSCHEME_PATH=\"$themedir/$VARIANT.sh\"|" $polybar_env

# rofi
rofi_colors_rasi="$HOME/.config/rofi/colorscheme.rasi"

sed -i "s/background: .*/background: "$COLOR_BACKGROUND"D9;/" $rofi_colors_rasi
sed -i "s/background-alt: .*/background-alt: $COLOR_BACKGROUND_ALT;/" $rofi_colors_rasi
sed -i "s/foreground: .*/foreground: $COLOR_FOREGROUND;/" $rofi_colors_rasi
sed -i "s/selected: .*/selected: $COLOR_PRIMARY;/" $rofi_colors_rasi
sed -i "s/secondary: .*/secondary: $COLOR_SECONDARY;/" $rofi_colors_rasi
sed -i "s/tertiary: .*/tertiary: $COLOR_TERTIARY;/" $rofi_colors_rasi
sed -i "s/disabled: .*/disabled: $COLOR_DISABLED;/" $rofi_colors_rasi
sed -i "s/active: .*/active: $COLOR_ACTIVE;/" $rofi_colors_rasi
sed -i "s/urgent: .*/urgent: $COLOR_URGENT;/" $rofi_colors_rasi
