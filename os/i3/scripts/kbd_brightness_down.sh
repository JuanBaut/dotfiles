#!/usr/bin/env bash

brightnessctl --device=asus::kbd_backlight set 33%-

brightness="$(brightnessctl --device=asus::kbd_backlight get)"

percentage=$((brightness * 100 / 3))

dunstify "Keyboard brightness" "$brightness" -u low -r 799 -h int:value:"$percentage"
