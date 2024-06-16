#!/usr/bin/env bash

set -e

icons="$HOME/.local/share/icons"
dotfiles="$HOME/box/dotfiles"

# Alacritty
echo "-> Creating symlink for macOS in $icons/macOS"

if [ -d "$icons/macOS" ]; then
    rm -rf "$icons/macOS"
fi
ln -sf "$dotfiles/hyprland/macOS" "$icons/macOS"
