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

# .imwheelrc
echo "-> Creating symlink for .imwheelrc in $HOME"
if [ -f /$HOME/.imwheelrc ]; then
  rm /$HOME/.imwheelrc
fi

ln -sf "$DOTFILES/.imwheelrc" "$HOME" 
