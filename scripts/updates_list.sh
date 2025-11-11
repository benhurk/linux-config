#!/usr/bin/env bash

set -e

log() { echo -e "\033[1;32m[$1]\033[0m"; }

log "apt"
apt list --upgradable

log "flatpak"
flatpak remote-ls --updates
