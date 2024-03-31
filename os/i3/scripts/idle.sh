#!/usr/bin/env bash

xidlehook \
    --detect-sleep \
    --not-when-audio \
    --not-when-fullscreen \
    --timer 20 "$HOME/.config/i3/scripts/lock.sh" '' \
