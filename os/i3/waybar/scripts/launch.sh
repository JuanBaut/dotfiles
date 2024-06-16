#!/usr/bin/env bash

killall waybar

if [ "$USER" = "harsh" ]; then
	waybar -c "$HOME/.config/waybar/config.jsonc" &
	-s "$HOME/.config/waybar/style.css"
else
	waybar &
fi
