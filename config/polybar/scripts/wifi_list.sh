#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[$1]\033[0m"; }

log "Buscando redes disponíves..."
nmcli -f IN-USE,SSID,RATE,SIGNAL,BARS,SECURITY device wifi list
