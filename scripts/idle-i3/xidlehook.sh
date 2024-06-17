#!/usr/bin/env bash

xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 60 \
    "$HOME/.config/i3/scripts/idle/pre_idle.sh" \
    "$HOME/.config/i3/scripts/idle/post_idle.sh" \
    --timer 10 \
    "$HOME/.config/i3/scripts/idle/lock_idle.sh; $HOME/.config/i3/scripts/idle/post_idle.sh" \
    ''\
    --timer 300 \
    'systemctl suspend' \
    ''
