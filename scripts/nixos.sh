#!/usr/bin/env sh

# --> --> --> dagger's install script for nixos config <-- <-- <--

set -e

cd

BOX="/$HOME/box"
DOTFILES="/$BOX/dotfiles"

echo "-> Creating symlink for nixos config in /etc/nixos"
if [ -d "/etc/nixos" ]; then
    sudo rm -rf "/etc/nixos"
fi

sudo ln -sf "$DOTFILES/nixos" "/etc/"
