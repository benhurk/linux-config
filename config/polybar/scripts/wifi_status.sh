#!/usr/bin/env bash

COLOR_SECONDARY=#ffb86c
COLOR_ALERT=#e06c75

SIGNAL=$(nmcli -g ACTIVE,SIGNAL device wifi list | awk -F: '/^(sim|yes)/ {print $2}')
STATUS=$(nmcli radio wifi)

SIGNAL=${SIGNAL:-0}

if [ $STATUS == "enabled" ]; then
  if [ $SIGNAL -eq 0 ]; then
    LABEL="%{F$COLOR_SECONDARY}󱑞%{F-}"
  elif [ $SIGNAL -le 25 ]; then
    LABEL="%{F$COLOR_ALERT}󰤫%{F-}"
  elif [ $SIGNAL -le 50 ]; then
    LABEL="󰤠"
  elif [ $SIGNAL -le 75 ]; then
    LABEL="󰤢"
  elif [ $SIGNAL -le 99 ]; then
    LABEL="󰤥"
  else
    LABEL="󰤨"
  fi
else
  LABEL="%{F$COLOR_ALERT}󰤮%{F-}"
fi

echo "$LABEL"
