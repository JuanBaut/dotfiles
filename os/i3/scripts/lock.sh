#!/usr/bin/env sh

keyboard="$(brightnessctl --device=asus::kbd_backlight get)"
screen="$(brightnessctl get)"

dunstctl set-paused true
brightnessctl -q --device=asus::kbd_backlight set 0
brightnessctl -q set 10%

i3lock-color -n -k --color=000000 --time-color=ffffff --date-color=ffffff \
    --ind-pos="x+45:y+1025" --time-pos="x+100:y+55" --radius=15 --wrong-text="" \
    --verif-text="" --noinput-text="" --ring-color=202020 --insidever-color=000000 \
    --insidewrong-color=000000 --ringver-color=ffffff --ringwrong-color=920914 \
    --bshl-color=920914 --keyhl-color=ffffff \
    --time-font="Geist Mono Nerd Font" --date-font="Geist Mono Nerd Font"

brightnessctl -q --device=asus::kbd_backlight set "$keyboard"
brightnessctl -q set "$screen"
dunstctl set-paused false
