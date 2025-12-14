#!/bin/bash

if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  bluetoothctl power on
else
  bluetoothctl power off
fi
