#!/bin/bash

BEFORE="/mnt/c/Users/dagger/AppData/Roaming"
WIN="/mnt/c/Users/dagger/AppData/Roaming/alacritty"
DOTFILES="/$BOX/dotfiles"

echo -e "\nChecking for folder in $BEFORE\n"

if ! [ -d "/$BEFORE/alacritty" ]; then
    cd "$BEFORE" && mkdir alacritty
fi

echo -e "\nCreating symlink for alacritty config in $WIN\n"

if [ -f "/$WIN/alacritty.yml" ]; then
    rm "/$WIN/alacritty.yml"
fi

ln -sf "$DOTFILES/alacritty/alacritty.yml" "$WIN"
