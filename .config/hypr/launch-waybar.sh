#!/usr/bin/env bash

trap 'kill $(pgrep .waybar-wrapped)' EXIT

while true; do
    waybar &
    inotifywait -e create,modify $HOME/.config/waybar/*
    kill $(pgrep .waybar-wrapped)
done
