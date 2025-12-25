#!/bin/bash

VARIANT=$1

if [ -z "$VARIANT" ]; then
  echo "Usage: $0 <variant>"
  echo "Variants: dark light"
  echo "Example: $0 dark"
  exit 1
fi

if [ $VARIANT == "dark" ]; then
  papirus-folders --color cat-macchiato-lavender >/dev/null
elif [ $VARIANT == "light" ]; then
  papirus-folders --color cat-latte-lavender >/dev/null
else
  echo "Invalid variant. Available: dark or light"
  exit 1
fi
