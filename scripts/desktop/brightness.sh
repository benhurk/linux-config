#!/bin/bash

step=0.1
current=$(xrandr --verbose --current | awk -F': ' '/Brightness/ {print $2}')

increase() {
  if [ $(echo "$current < 1.0" | bc -l) -eq 1 ]; then
    xsct -d 0 $step 2>/dev/null

    notify-send \
      --hint=string:x-dunst-stack-tag:Brightness \
      "󰃠 Brilho: $(xrandr --verbose --current | awk -F': ' '/Brightness/ {print $2}')"
  fi
}

decrease() {
  if [ $(echo "$current > 0.1" | bc -l) -eq 1 ]; then
    xsct -d 0 -$step 2>/dev/null

    notify-send \
      --hint=string:x-dunst-stack-tag:Brightness \
      "󰃠 Brilho: $(xrandr --verbose --current | awk -F': ' '/Brightness/ {print $2}')"
  fi
}

case "$1" in
increase) increase ;;
decrease) decrease ;;
*) echo "$current" ;;
esac
