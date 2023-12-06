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
echo "-> Cloning dagger's neovim repo and creating symlink in $XDG_CONFIG_HOME"

git clone git@github.com:JuanBaut/nvim.git /$BOX/nvim 

if [ -d /$XDG_CONFIG_HOME/nvim ]; then
  sudo rm -r /$XDG_CONFIG_HOME/nvim
fi

cd
ln -sf "$BOX/nvim" "$XDG_CONFIG_HOME/nvim"

# oh-my-zsh! 
echo "-> Installing oh-my-zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# p10k shell prompt
echo "-> Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-syntax-highlighting
echo "-> Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
echo "-> Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# .zshrc
echo "-> Creating symlink for .zshrc in $HOME"
if [ -f /$HOME/.zshrc ]; then
  rm /$HOME/.zshrc
fi

ln -sf "$DOTFILES/.zshrc" "$HOME" 

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "-> Creating symlink for tmux config in $HOME"
if [ -f /$HOME/.tmux.conf ]; then
  mv /$HOME/.tmux.conf /$HOME/.tmux.conf.backup 
fi

ln -sf "$DOTFILES/.tmux.conf" "$HOME"

# Nvm
echo "-> Checking if nvm is already installed and then installing nvm in case it is'nt"
if ! command -v nvm >/dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  nvm install node
else
  echo "-> nvm is already installed, skipping..."
fi

echo "-> We're done, get coding."
