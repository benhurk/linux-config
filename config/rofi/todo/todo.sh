#!/bin/bash

style="$HOME/.config/rofi/todo/style.rasi"

options=$(todo ls --no-index)
active=$(echo "$options" | grep -n "$(todo current)" | awk -F':' '{print $1}')

rofi_cmd() {
    echo -e "$options" | rofi -dmenu -i -no-custom -format 'd' -a "$(("$active" - 1))" -theme "$style"
}

chosen="$(rofi_cmd)"

if [ -n "$chosen" ]; then
    todo set --index "$chosen"
fi
