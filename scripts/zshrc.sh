#!/usr/bin/env bash

set -e

DOTFILES="$HOME/box/dotfiles"

# .zshrc
echo "-> Creating symlink for .zshrc in $HOME"
if [ -f "/$HOME/.zshrc" ]; then
    rm "/$HOME/.zshrc"
fi
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME"
