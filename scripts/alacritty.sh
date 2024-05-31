#!/usr/bin/env bash

set -e

config="$HOME/.config"
dotfiles="$HOME/box/dotfiles"

# Alacritty
echo "-> Creating symlink for Alacritty config in $config/alacritty"

if [ -d "$config/alacritty" ]; then
    rm -rf "$config/alacritty"
fi
ln -sf "$dotfiles/alacritty" "$config/alacritty"
