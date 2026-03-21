#!/bin/bash

style="$HOME/.config/rofi/leap/style.rasi"

options=$(leap ls)

if [ -n "$options" ]; then
    rofi_cmd() {
        echo -e "$options" | rofi -dmenu -i -no-custom -theme "$style"
    }
else
    rofi_cmd() {
        rofi -dmenu -mesg "󱎘 No leaps created yet." -theme "$style"
    }
fi

chosen="$(rofi_cmd | sed -e "s/~/\/home\/$USER/" -e "s/\//_/g")"

if [ -n "$chosen" ]; then
    leap to "$chosen"
fi
