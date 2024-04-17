#!/bin/sh

# --> --> --> dagger's install script for tmux colors <-- <-- <--

set -e

cd "$HOME"

DOTFILES="$HOME/box/dotfiles"

# Colorscheme
echo "Creating symlink for tmux theme in $HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"
if [ -f "$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme" ]; then
    rm "$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"
fi
ln -sf "$DOTFILES/tmux/catppuccin-latte.tmuxtheme" "$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"

# Configuration
echo "Creating symlink for tmux config in $HOME"
if [ -f "$HOME/.tmux.conf" ]; then
    rm "$HOME/.tmux.conf"
fi
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME"
