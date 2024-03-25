#!/usr/bin/env bash

xidlehook \
    --detect-sleep \
    --not-when-audio \
    --not-when-fullscreen \
    --timer 5 "brightnessctl set 100%" \
    --timer 10 "$HOME/box/dotfiles/os/i3/scripts/lock.sh" \
    --timer 360 "systemctl suspend"
