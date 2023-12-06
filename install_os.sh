#!/bin/bash

# --> --> --> dagger's install script <-- <-- <--

set -e

# environment variables for references
# XDG_CACHE_HOME=$HOME/.cache
XDG_CONFIG_HOME=$HOME/.config
# XDG_DATA_HOME=$HOME/.local/share
# XDG_STATE_HOME=$HOME/.local/state

BOX="/$HOME/box"
DOTFILES="/$BOX/dotfiles"

# Kitty
echo "-> Creating symlink for kitty terminal config files in $XDG_CONFIG_HOME"
if [ -d /$XDG_CONFIG_HOME/kitty ]; then
  rm -r /$XDG_CONFIG_HOME/kitty
fi

ln -sf  "$DOTFILES/kitty" "$XDG_CONFIG_HOME/kitty"

# Sway
echo "-> Creating symlink for sway config files in $XDG_CONFIG_HOME"
if [ -d /$XDG_CONFIG_HOME/sway ]; then
  rm -rf /$XDG_CONFIG_HOME/sway
fi

ln -sf  "$DOTFILES/sway" "$XDG_CONFIG_HOME/sway"

# Waybar
echo "-> Creating symlink for waybar config files in $XDG_CONFIG_HOME"
if [ -d /$XDG_CONFIG_HOME/waybar ]; then
  rm -rf /$XDG_CONFIG_HOME/waybar
fi

ln -sf  "$DOTFILES/waybar" "$XDG_CONFIG_HOME/waybar"

# Dunst
echo "-> Creating symlink for dunst config files in $XDG_CONFIG_HOME"
if [ -d /$XDG_CONFIG_HOME/dunst ]; then
  rm -rf /$XDG_CONFIG_HOME/dunst
fi

ln -sf  "$DOTFILES/dunst" "$XDG_CONFIG_HOME/dunst"

# Rofi
echo "-> Creating symlink for rofi config files in $XDG_CONFIG_HOME"
if [ -d /$XDG_CONFIG_HOME/rofi ]; then
  rm -rf /$XDG_CONFIG_HOME/rofi
fi

ln -sf  "$DOTFILES/rofi" "$XDG_CONFIG_HOME/rofi"

echo "-> We're done, everything should look better now."
