#!/bin/bash

check() {
    if ! nmcli &>/dev/null; then
        echo "Error: nmcli not found. Is network-manager installed/running?"
        exit 1
    fi

    if [ -n "$(nmcli connection show --active | grep "wireguard")" ]; then
        echo true
    else
        echo false
    fi
}

toggle() {
    if [[ $(check) == true ]]; then
        nmcli connection show --active | grep "wireguard" | awk '{print $1}' | while read -r interface; do
            nmcli connection down "$interface"
        done

        notify-send -i network-vpn "VPN" "Desconectado"
    else
        to_connect=$(nmcli connection show | grep "wireguard" | awk '{print $1}')

        if [ -z "$to_connect" ]; then
            echo "Error: No wireguard connection available."
            exit 1
        fi

        nmcli connection up "$to_connect"
        notify-send -i network-vpn "VPN" "Conectado"

    fi
}

case "$1" in
    check) check ;;
    toggle) toggle ;;
    *) check ;;
esac
