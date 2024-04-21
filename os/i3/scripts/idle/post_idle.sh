#!/usr/bin/env bash

post_idle() {
    KEYBOARD_BRIGHTNESS_IDLE=$(cat /tmp/keyboard_brightness_idle.tmp)
    SCREEN_BRIGHTNESS_IDLE=$(cat /tmp/screen_brightness_idle.tmp)

    brightnessctl -q --device=asus::kbd_backlight set "$KEYBOARD_BRIGHTNESS_IDLE"
    brightnessctl -q set "$SCREEN_BRIGHTNESS_IDLE"
    dunstctl set-paused false

    rm /tmp/keyboard_brightness_idle.tmp
    rm /tmp/screen_brightness_idle.tmp
}

post_idle
