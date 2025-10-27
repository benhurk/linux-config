#!/usr/bin/env bash

apt_updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
flatpak_updates=$(flatpak remote-ls --updates 2>/dev/null | wc -l)

echo $((apt_updates + flatpak_updates))
