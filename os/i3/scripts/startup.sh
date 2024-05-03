#!/usr/bin/env bash

# Check if alacritty is running
if ! pgrep alacritty > /dev/null; then
    alacritty &
fi

# Check if firefox-devedition is running
if ! pgrep firefox-devedition > /dev/null; then
    firefox-devedition &
fi

# Check if firefox is running
if ! pgrep firefox > /dev/null; then
    firefox &
fi

# Check if spotify is running
if ! pgrep spotify > /dev/null; then
    spotify &
fi
