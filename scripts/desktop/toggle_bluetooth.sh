#!/bin/bash

if [ -z $(bluetoothctl show | grep "Powered: yes") ]; then
  bluetoothctl power on
else
  bluetoothctl power off
fi
