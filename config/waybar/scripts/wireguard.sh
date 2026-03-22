#!/bin/bash

if ! nmcli &>/dev/null; then
    echo "Error: nmcli not found. Is network-manager installed and running?"
    exit 1
fi

if ! wg --help &>/dev/null; then
    echo "Error: wireguard not found. Is it installed?"
    exit 1
fi

if [ -n "$(nmcli connection show --active | grep "wireguard")" ]; then
    echo "{\"text\": \"󰢏\", \"class\": \"connected\"}"
else
    echo "{\"text\": \"󰨒\", \"class\": \"disconnected\"}"
fi
