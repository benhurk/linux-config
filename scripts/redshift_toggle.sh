#!/usr/bin/env bash

source "$HOME/scripts/env.sh"

GAMMA=$(xrandr --verbose --current | awk -F' ' '/Gamma:/ {print $2; exit}' | xargs)
BRIGHTNESS=$(xrandr --verbose --current | awk -F':' '/Brightness/ {print $2; exit}' | xargs)

if [[ "$GAMMA" != "1.0:1.0:1.0" ]]; then
  redshift -oP -O $DEFAULT_TEMP -b $BRIGHTNESS
else
  redshift -oP -O $REDSHIFT_TEMP -b $BRIGHTNESS
fi

polybar-msg action "#screen.hook.0"
