#!/usr/bin/env bash

keyboard="$(brightnessctl --device=asus::kbd_backlight get)"
screen="$(brightnessctl get)"

dunstctl set-paused true
brightnessctl -q --device=asus::kbd_backlight set 0
brightnessctl -q set 5%

sh "$HOME/.config/i3/scripts/lock/i3-lock.sh"

brightnessctl -q --device=asus::kbd_backlight set "$keyboard"
brightnessctl -q set "$screen"
dunstctl set-paused false
