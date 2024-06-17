#!/usr/bin/env bash

xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 60 \
    "./pre_idle.sh" \
    "./post_idle.sh" \
    --timer 10 \
    "./lock_idle.sh; ./post_idle.sh" \
    ''\
    --timer 300 \
    'systemctl suspend' \
    ''
