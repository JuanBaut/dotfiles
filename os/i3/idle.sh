#!/usr/bin/env sh

xidlehook \
    --detect-sleep \
    --not-when-audio \
    --not-when-fullscreen \
    --timer 60 "xset dpms force standby" '' \
    --timer 180 "sh $HOME/.config/i3/lock.sh" '' \
    --timer 360 "systemctl suspend" ''
