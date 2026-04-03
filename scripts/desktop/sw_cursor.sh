#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Please specify which cursor theme to use."
    echo "$(basename "$0") <theme-name> <size>"
    echo "Example: $(basename "$0") Adwaita 24"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Please specify which size to set (in pixels)."
    echo "$(basename "$0") <theme-name> <size>"
    echo "Example: $(basename "$0") Adwaita 24"
    exit 1
fi

theme_name="$1"
size="$2"

gsettings set org.gnome.desktop.interface cursor-theme \'"$theme_name"\'
gsettings set org.gnome.desktop.interface cursor-size \'"$size"\'

user_default=$(ls $HOME/.icons/default/index.theme || ls $HOME/.local/share/icons/default/index.theme)

if [ -f "$user_default" ]; then
    sed "s/Inherits=.*/Inherits=$theme_name/" "$user_default"
else
    mkdir -p $HOME/.icons/default && touch $HOME/.icons/default/index.theme
    echo -e "
    [Icon Theme]\n
    Name=Default\n
    Comment=Default Cursor Theme\n
    Inherits=$theme_name
    " > $HOME/.icons/default/index.theme
fi

echo "Cursor theme changed to $theme_name ($size\px). Restart your session for the change to take effect."
