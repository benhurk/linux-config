#!/usr/bin/env bash

STEP=0.1
CURRENT=$(xrandr --verbose --current | awk -F': ' '/Brightness/ {print $2}')

increase() {
  if [ $(echo "$CURRENT < 1.0" | bc -l) -eq 1 ]; then
    xsct -d 0 $STEP 2>/dev/null

    notify-send \
      --hint=string:x-dunst-stack-tag:Brightness \
      "󰃠 Brilho: $(xrandr --verbose --current | awk -F': ' '/Brightness/ {print $2}')"
  fi
}

decrease() {
  if [ $(echo "$CURRENT > 0.1" | bc -l) -eq 1 ]; then
    xsct -d 0 -$STEP 2>/dev/null

    notify-send \
      --hint=string:x-dunst-stack-tag:Brightness \
      "󰃠 Brilho: $(xrandr --verbose --current | awk -F': ' '/Brightness/ {print $2}')"
  fi
}

case "$1" in
increase) increase ;;
decrease) decrease ;;
*) echo "$CURRENT" ;;
esac
