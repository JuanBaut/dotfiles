#!/usr/bin/env bash

amixer set Master -q 5%+

volume="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"

if [[ $volume == 0 || $mute == "off" ]]; then
    dunstify "Volume" "Sound OFF" -u low -r 797
else
    dunstify "Volume" "$volume %" -u low -r 797 -h int:value:"$volume"
fi
