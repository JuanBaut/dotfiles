#!/usr/bin/env bash

brightnessctl -q set 10%-

brightness="$(brightnessctl get)"

percentage=$((brightness * 100 / 19200))

dunstify "Brightness" "$percentage%" -u low -t 1000 -r 798 -h int:value:"$percentage"
