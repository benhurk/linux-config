#!/bin/bash

check() {
    if [ $(pgrep gammastep | wc -l) -gt 0 ]; then
        echo true
    else
        echo false
    fi
}

toggle() {
    if [[ $(check) == true ]]; then
        pkill gammastep
    else
        gammastep -o
    fi
}

case "$1" in
    check) check ;;
    *) toggle ;;
esac
