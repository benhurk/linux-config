#!/bin/bash

current_temp=$(xsct | awk -F' ' '{print $5}')

temp_day=6500
brightness_day=1.0
temp_night=3200
brightness_night=0.9

if [ $current_temp -lt $temp_day ]; then
  xsct $temp_day $brightness_day
else
  xsct $temp_night $brightness_night
fi
