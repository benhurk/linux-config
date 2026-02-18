#!/bin/bash

check() {
    if [ ! -z "$(bluetoothctl show | grep "Powered: yes")" ]; then
        echo true
    else
        echo false
    fi
}

toggle() {
    if [[ $(check) == true ]]; then
        bluetoothctl power off
    else
        bluetoothctl power on
    fi
}

case "$1" in
    check) check ;;
    toggle) toggle ;;
    *) check ;;
esac
