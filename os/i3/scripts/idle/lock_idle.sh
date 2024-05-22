#!/usr/bin/env bash

locking() {
    i3lock-color -n -k \
        --color=000000 \
        --time-color=ffffff \
        --date-color=ffffff \
        --ind-pos="x+45:y+1025" \
        --time-pos="x+100:y+55" \
        --radius=15 \
        --lock-text=""\
        --verif-text="" \
        --wrong-text="" \
        --noinput-text="" \
        --lockfailed-text=""\
        --greeter-text=""\
        --no-modkey-text \
        --ring-color=202020 \
        --insidever-color=000000 \
        --insidewrong-color=000000 \
        --ringver-color=ffffff \
        --ringwrong-color=920914 \
        --bshl-color=920914 \
        --keyhl-color=ffffff \
        --time-font="ZedMono Nerd Font" \
        --date-font="ZedMono Nerd Font"
}

locking
