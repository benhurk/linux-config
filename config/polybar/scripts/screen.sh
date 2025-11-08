#!/usr/bin/env bash

source "$HOME/scripts/env.sh"
source "$HOME/scripts/polybar/env.sh"

STEP=0.1
BRIGHTNESS=$(xrandr --verbose --current | awk -F':' '/Brightness/ {print $2; exit}' | xargs)
GAMMA=$(xrandr --verbose --current | awk -F' ' '/Gamma:/ {print $2; exit}' | xargs)

if [ $GAMMA != '1.0:1.0:1.0' ]; then
  TEMP=$REDSHIFT_TEMP
else
  TEMP=$DEFAULT_TEMP
fi

increase() {
  NEW=$(bc -l <<<"$BRIGHTNESS + $STEP")
  redshift -oP -O "$TEMP" -b "$NEW"
  polybar-msg action "#screen.hook.0"
}

decrease() {
  NEW=$(bc -l <<<"$BRIGHTNESS - $STEP")
  redshift -oP -O "$TEMP" -b "$NEW"
  polybar-msg action "#screen.hook.0"
}

show() {
  if [ $GAMMA != '1.0:1.0:1.0' ]; then
    echo "%{F$COLOR_SECONDARY}󰃝%{F-} $BRIGHTNESS"
  else
    echo "%{F$COLOR_PRIMARY}󰃠%{F-} $BRIGHTNESS"
  fi
}

case "$1" in
increase) increase ;;
decrease) decrease ;;
show | *) show ;;
esac
