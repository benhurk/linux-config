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

# sway
sway_config="$HOME/.config/sway/colors.conf"

sed -i "s/^\(set \$color_background \).*/\1$COLOR_BACKGROUND/" $sway_config
sed -i "s/^\(set \$color_background_alt \).*/\1$COLOR_BACKGROUND_ALT/" $sway_config
sed -i "s/^\(set \$color_foreground \).*/\1$COLOR_FOREGROUND/" $sway_config
sed -i "s/^\(set \$color_primary \).*/\1$COLOR_PRIMARY/" $sway_config
sed -i "s/^\(set \$color_secondary \).*/\1$COLOR_SECONDARY/" $sway_config
sed -i "s/^\(set \$color_tertiary \).*/\1$COLOR_TERTIARY/" $sway_config
sed -i "s/^\(set \$color_disabled \).*/\1$COLOR_DISABLED/" $sway_config
sed -i "s/^\(set \$color_active \).*/\1$COLOR_ACTIVE/" $sway_config
sed -i "s/^\(set \$color_urgent \).*/\1$COLOR_URGENT/" $sway_config

# waybar
waybar_css="$HOME/.config/waybar/colors.css"

sed -i "s/bg #.*;/bg $COLOR_BACKGROUND;/" $waybar_css
sed -i "s/bg-alt #.*;/bg-alt $COLOR_BACKGROUND_ALT;/" $waybar_css
sed -i "s/bg-contrast #.*;/bg-contrast $COLOR_BACKGROUND_CONTRAST;/" $waybar_css
sed -i "s/fg #.*;/fg $COLOR_FOREGROUND;/" $waybar_css
sed -i "s/primary #.*;/primary $COLOR_PRIMARY;/" $waybar_css
sed -i "s/secondary #.*;/secondary $COLOR_SECONDARY;/" $waybar_css
sed -i "s/tertiary #.*;/tertiary $COLOR_TERTIARY;/" $waybar_css
sed -i "s/disabled #.*;/disabled $COLOR_DISABLED;/" $waybar_css
sed -i "s/active #.*;/active $COLOR_ACTIVE;/" $waybar_css
sed -i "s/urgent #.*;/urgent $COLOR_URGENT;/" $waybar_css

# swaync
swaync_css="$HOME/.config/swaync/style.css"

sed -i "s/bg #.*;/bg $COLOR_BACKGROUND;/" $swaync_css
sed -i "s/bg-alt #.*;/bg-alt $COLOR_BACKGROUND_ALT;/" $swaync_css
sed -i "s/bg-contrast #.*;/bg-contrast $COLOR_BACKGROUND_CONTRAST;/" $swaync_css
sed -i "s/fg #.*;/fg $COLOR_FOREGROUND;/" $swaync_css
sed -i "s/primary #.*;/primary $COLOR_PRIMARY;/" $swaync_css
sed -i "s/secondary #.*;/secondary $COLOR_SECONDARY;/" $swaync_css
sed -i "s/tertiary #.*;/tertiary $COLOR_TERTIARY;/" $swaync_css
sed -i "s/disabled #.*;/disabled $COLOR_DISABLED;/" $swaync_css
sed -i "s/active #.*;/active $COLOR_ACTIVE;/" $swaync_css
sed -i "s/urgent #.*;/urgent $COLOR_URGENT;/" $swaync_css

# rofi
rofi_rasi="$HOME/.config/rofi/colorscheme.rasi"

sed -i "s/\(bg: \)#.*;/\1$COLOR_BACKGROUND;/" $rofi_rasi
sed -i "s/\(bg-alt: \)#.*;/\1$COLOR_BACKGROUND_ALT;/" $rofi_rasi
sed -i "s/\(bg-contrast: \)#.*;/\1$COLOR_BACKGROUND_CONTRAST;/" $rofi_rasi
sed -i "s/\(fg: \)#.*;/\1$COLOR_FOREGROUND;/" $rofi_rasi
sed -i "s/\(primary: \)#.*;/\1$COLOR_PRIMARY;/" $rofi_rasi
sed -i "s/\(secondary: \)#.*;/\1$COLOR_SECONDARY;/" $rofi_rasi
sed -i "s/\(tertiary: \)#.*;/\1$COLOR_TERTIARY;/" $rofi_rasi
sed -i "s/\(disabled: \)#.*;/\1$COLOR_DISABLED;/" $rofi_rasi
sed -i "s/\(active: \)#.*;/\1 $COLOR_ACTIVE;/" $rofi_rasi
sed -i "s/\(urgent: \)#.*;/\1$COLOR_URGENT;/" $rofi_rasi
