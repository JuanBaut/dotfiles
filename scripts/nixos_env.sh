#!/usr/bin/env sh

# --> --> --> dagger's install script for nixos config <-- <-- <--

set -e

cd

BOX="$HOME/box"
DOTFILES="$BOX/dotfiles"
CONFIG="$HOME/.config"

echo "$CONFIG"

echo "-> Creating symlink for i3 config in $CONFIG/i3"
if [ -d "$CONFIG/i3" ]; then
    rm -rf "$CONFIG/i3"
fi
ln -sf "$DOTFILES/os/i3" "$CONFIG/i3"

echo "-> Creating symlink for dunst config in $CONFIG/dunst"
if [ -d "$CONFIG/dunst" ]; then
    rm -rf "$CONFIG/dunst"
fi
ln -sf "$DOTFILES/os/dunst" "$CONFIG/dunst"

echo "-> Creating symlink for polybar config in $CONFIG/polybar"
if [ -d "$CONFIG/polybar" ]; then
    rm -rf "$CONFIG/polybar"
fi
ln -sf "$DOTFILES/os/polybar" "$CONFIG/polybar"

echo "-> Creating symlink for rofi config in $CONFIG/rofi"
if [ -d "$CONFIG/rofi" ]; then
    rm -rf "$CONFIG/rofi"
fi
ln -sf "$DOTFILES/os/rofi" "$CONFIG/rofi"

echo "-> Creating symlink for alacritty config in $CONFIG/alacritty"
if [ -d "$CONFIG/alacritty" ]; then
    rm -rf "$CONFIG/alacritty"
fi
ln -sf "$DOTFILES/alacritty" "$CONFIG/alacritty"

echo "-> Creating symlink for X stuff at $HOME"
if [ -f "$HOME/.Xresources" ]; then
    rm "$HOME/.Xresources"
fi
ln -sf "$DOTFILES/os/X/.Xresources" "$HOME"

if [ -f "$HOME/.xinitrc" ]; then
    rm "$HOME/.xinitrc"
fi
ln -sf "$DOTFILES/os/X/.xinitrc" "$HOME"
