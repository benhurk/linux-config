#!/bin/bash

check() {
  if [ $(powerprofilesctl get) == "performance" ]; then
    echo true
  else
    echo false
  fi
}

toggle() {
  if [[ $(check) == true ]]; then
    powerprofilesctl set balanced
    notify-send -i cpu "CPU" "Modo: Balanceado"
  else
    powerprofilesctl set performance
    notify-send -i cpu "CPU" "Modo: Performance"
  fi
}

case "$1" in
check) check ;;
*) toggle ;;
esac
