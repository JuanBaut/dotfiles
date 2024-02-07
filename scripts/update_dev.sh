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

# Neovim
if [ -d "/$BOX/nvim" ]; then
    sudo rm -rf "/$BOX/nvim"
fi

echo "-> Cloning dagger's neovim repo and creating symlink in $XDG_CONFIG_HOME"

git clone git@github.com:JuanBaut/nvim.git "/$BOX/nvim"

if [ -d "/$XDG_CONFIG_HOME/nvim" ]; then
    sudo rm -rf "/$XDG_CONFIG_HOME/nvim"
fi

cd
ln -sf "$BOX/nvim" "$XDG_CONFIG_HOME/nvim"

# .zshrc
echo "-> Creating symlink for .zshrc in $HOME"
if [ -f "/$HOME/.zshrc" ]; then
    rm "/$HOME/.zshrc"
fi
ln -sf "$DOTFILES/.zshrc" "$HOME"

# Tmux
echo "-> Cloning tmux-tpm in case it isnt there yet in $HOME/.tmux/plugins/tpm"
if ! [ -d "/$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "-> Creating symlink for tmux config in $HOME"
if [ -f "/$HOME/.tmux.conf" ]; then
    rm "/$HOME/.tmux.conf"
fi
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME"

echo "-> Creating symlink for tmux theme in $HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"
if [ -f "/$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme" ]; then
    rm "/$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"
fi
ln -sf "$DOTFILES/tmux/catppuccin-latte.tmuxtheme" "/$HOME/.tmux/plugins/tmux/catppuccin-latte.tmuxtheme"

# Neofetch
echo "-> Creating symlink for Neofetch config in $HOME/.config/neofetch"
if ! [ -d "/$XDG_CONFIG_HOME/neofetch" ]; then
    mkdir "/$XDG_CONFIG_HOME/neofetch"
fi
if [ -f "/$XDG_CONFIG_HOME/neofetch/config.conf" ]; then
    rm "/$XDG_CONFIG_HOME/neofetch/config.conf"
fi
ln -sf "$DOTFILES/neofetch/config.conf" "$XDG_CONFIG_HOME/neofetch/config.conf"
