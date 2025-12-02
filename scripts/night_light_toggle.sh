#!/usr/bin/env bash

CURRENT_TEMP=$(xsct | awk -F' ' '{print $5}')
CURRENT_BRIGHTNESS=$(xsct | awk -F' ' '{print $6}')

TEMP_DAY=6500
BRIGHTNESS_DAY=1.0
TEMP_NIGHT=3500
BRIGHTNESS_NIGHT=0.9

if [ $CURRENT_TEMP -lt $TEMP_DAY ]; then
  xsct $TEMP_DAY $BRIGHTNESS_DAY
else
  xsct $TEMP_NIGHT $BRIGHTNESS_NIGHT
fi

polybar-msg action "#screen.hook.0" >/dev/null
