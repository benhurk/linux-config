#!/bin/bash

checkdir() {
  if [ ! -d "$HOME/Imagens/screenshots" ]; then
    mkdir -p $HOME/Imagens/screenshots
  fi
}

area() {
  if [ $(grimshot save area ~/Imagens/screenshots/$(date +\"%Y-%m-%d_%H-%M-%S\").png) ]; then
    notify-send -i image Screenshot ~/Imagens/wallpapers/
  fi
}

screen() {
  if [ $(grimshot save screen ~/Imagens/screenshots/$(date +\"%Y-%m-%d_%H-%M-%S\").png) ]; then
    notify-send -i image Screenshot ~/Imagens/wallpapers/
  fi
}

window() {
  if [ $(grimshot save window ~/Imagens/screenshots/$(date +\"%Y-%m-%d_%H-%M-%S\").png) ]; then
    notify-send -i image Screenshot ~/Imagens/wallpapers/
  fi
}

case $1 in
area) checkdir && area ;;
screen) checkdir && screen ;;
window) checkdir && window ;;
*) checkdir && screen ;;
esac
