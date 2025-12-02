#!/usr/bin/env bash

source "$HOME/scripts/polybar/env.sh"

BRIGHTNESS=$($HOME/scripts/brightness.sh)
TEMP=$(xsct | awk -F' ' '{print $5}')

if [ $TEMP -lt 6500 ]; then
  echo "%{F$COLOR_SECONDARY}󰃝%{F-} $BRIGHTNESS"
else
  echo "%{F$COLOR_PRIMARY}󰃠%{F-} $BRIGHTNESS"
fi
