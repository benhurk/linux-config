#!/bin/bash

scriptsdir="$HOME/.config/rofi/scripts"
themedir="$HOME/.config/rofi/scriptlauncher/style.rasi"

options=$(ls $scriptsdir)

run_rofi() {
  echo -e "$options" | rofi -dmenu -i -theme "$themedir"
}

chosen="$(run_rofi)"

# run script
$scriptsdir/"$chosen"
