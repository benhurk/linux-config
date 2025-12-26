#!/bin/bash

VARIANT=$1

if [ $VARIANT == "dark" ]; then
  papirus-folders --color cat-macchiato-mauve >/dev/null
elif [ $VARIANT == "light" ]; then
  papirus-folders --color cat-latte-lavender >/dev/null
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi
