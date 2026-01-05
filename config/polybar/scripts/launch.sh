#!/bin/bash

source "$HOME/.config/polybar/scripts/env.sh"

pkill polybar
polybar -q bar &
