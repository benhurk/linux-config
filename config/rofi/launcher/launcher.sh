#!/usr/bin/env bash

dir="$HOME/.config/rofi/launcher"
icon_theme=$(gsettings get org.gnome.desktop.interface icon-theme)

rofi \
    -show drun \
    -theme ${dir}/style.rasi \
    -icon-theme "${icon_theme//\'}"
