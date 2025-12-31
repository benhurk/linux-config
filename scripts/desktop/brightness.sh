#!/bin/bash

step=0.1

get_current() {
  current=$(xrandr --verbose --current | awk -F': ' '/Brightness/ {print $2}')
  echo "$current * 100 / 1" | bc
}

current=$(get_current)

increase() {
  if [ $current -lt 100 ]; then
    xsct -d 0 $step 2>/dev/null

    notify-send -u low \
      -h string:x-dunst-stack-tag:Brightness \
      -h int:value:$(get_current) \
      -i brightness \
      -t 1500 \
      "Brilho: $(get_current)%"
  fi
}

decrease() {
  if [ $current -gt 10 ]; then
    xsct -d 0 -$step 2>/dev/null

    notify-send -u low \
      -h string:x-dunst-stack-tag:Brightness \
      -h int:value:$(get_current) \
      -i brightness \
      -t 1500 \
      "Brilho: $(get_current)%"
  fi
}

case "$1" in
increase) increase ;;
decrease) decrease ;;
*) echo "$current" ;;
esac
