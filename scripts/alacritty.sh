#!/bin/bash

# --> --> --> dagger's install script <-- <-- <--

set -e

cd

# environment variables for references
# XDG_CACHE_HOME=$HOME/.cache
XDG_CONFIG_HOME=$HOME/.config
# XDG_DATA_HOME=$HOME/.local/share
# XDG_STATE_HOME=$HOME/.local/state

BOX="/$HOME/box"
DOTFILES="/$BOX/dotfiles"

# Alacritty
echo "-> Creating symlink for Alacritty config in $XDG_CONFIG_HOME/alacritty"
if ! [ -d "/$XDG_CONFIG_HOME/alacritty" ]; then
    mkdir "/$XDG_CONFIG_HOME/alacritty"
fi
if [ -f "/$XDG_CONFIG_HOME/alacritty/alacritty.toml" ]; then
    rm "/$XDG_CONFIG_HOME/alacritty/alacritty.toml"
fi
ln -sf "$DOTFILES/alacritty/alacritty.toml" "$XDG_CONFIG_HOME/alacritty/alacritty.toml"

echo "-> Creating symlink for Alacritty theme in $XDG_CONFIG_HOME/alacritty"
if [ -f "/$XDG_CONFIG_HOME/alacritty/theme.toml" ]; then
    rm "/$XDG_CONFIG_HOME/alacritty/theme.toml"
fi
ln -sf "$DOTFILES/alacritty/theme.toml" "$XDG_CONFIG_HOME/alacritty/theme.toml"
