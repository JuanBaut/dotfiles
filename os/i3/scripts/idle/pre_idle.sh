#!/usr/bin/env bash

pre_idle() {
    export KEYBOARD_BRIGHTNESS_IDLE
    KEYBOARD_BRIGHTNESS_IDLE="$(brightnessctl --device=asus::kbd_backlight get)"
    echo "$KEYBOARD_BRIGHTNESS_IDLE" > /tmp/keyboard_brightness_idle.tmp

    export SCREEN_BRIGHTNESS_IDLE
    SCREEN_BRIGHTNESS_IDLE="$(brightnessctl get)"
    echo "$SCREEN_BRIGHTNESS_IDLE" > /tmp/screen_brightness_idle.tmp

    # This is the most convenient way I found
    # for waking up the keyboard so the brightness
    # actually changes when the device is asleep
    xset led named "Scroll Lock"; sleep 0.1

    dunstctl set-paused true
    brightnessctl -q --device=asus::kbd_backlight set 0
    brightnessctl -q set 5%
}

pre_idle
