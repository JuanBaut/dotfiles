#!/bin/bash

# --> --> --> dagger's install script for tmux colors <-- <-- <--

set -e

cd

# environment variables for references
# XDG_CACHE_HOME=$HOME/.cache
# XDG_CONFIG_HOME=$HOME/.config
# XDG_DATA_HOME=$HOME/.local/share
# XDG_STATE_HOME=$HOME/.local/state

BOX="/$HOME/box"
DOTFILES="/$BOX/dotfiles"

echo "-> Creating symlink for tmux theme in $HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"
if [ -f "/$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme" ]; then
    rm "/$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"
fi

ln -sf "$DOTFILES/tmux/catppuccin-latte.tmuxtheme" "/$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"
