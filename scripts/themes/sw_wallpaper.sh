#!/bin/bash

image_path=$1

if [ -z "$image_path" ]; then
  echo "Usage: $(basename "$0") <image path>"
  exit 1
fi

if [ ! -e "$image_path" ]; then
  echo "Invalid image file path. $1"
  exit 1
fi

if [[ $(file -b "$image_path") == *"image data"* ]]; then
  feh --bg-fill $image_path
  sed -i "s|^set \$wallpaper .*|set \$wallpaper $image_path|" $HOME/.config/i3/wallpaper.conf
else
  echo "$1 is not a valid image file"
  exit 1
fi
