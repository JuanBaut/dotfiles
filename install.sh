#!/bin/bash

# --> --> --> dagger's install script <-- <-- <--

set -e

echo "Creating box directory"
cd
mkdir box

BOX="/$HOME/box"
CONFIG_FILES="/$HOME/.config"

# Neovim
echo "Cloning dagger's neovim repo and creating symlink in $CONFIG_FILES"

git clone https://github.com/JuanBaut/nvim.git /$BOX

if [ -d /$CONFIG_FILES/nvim ]; then
  rm -r /$CONFIG_FILES/nvim
fi

ln -sf ./$BOX/nvim /$CONFIG_FILES/nvim

# oh-my-zsh! 
echo "Installing oh-my-zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# p10k shell prompt
echo "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# .zshrc
echo "Creating symlink for .zshrc in $HOME"
if [ -f /$HOME/.zshrc ]; then
  mv /$HOME/.zshrc /$HOME/.zshrc.backup 
fi

ln -sf ./zshrc /$HOME

# Kitty
echo "Creating symlink for kitty terminal config files in $CONFIG_FILES"
if [ -d /$CONFIG_FILES/kitty ]; then
  rm -r /$CONFIG_FILES/kitty
fi

ln -sf ./kitty /$CONFIG_FILES/kitty

# Tmux
echo "Creating symlink for tmux config in $HOME"
if [ -f /$HOME/.tmux.conf ]; then
  mv /$HOME/.tmux.conf /$HOME/.tmux.conf.backup 
fi
ln -sf ./.tmux.conf /$HOME

# Nvm
echo "Checking if nvm is already installed and then installing nvm in case it is'nt"
if ! command -v nvm >/dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
else
  echo "nvm is already installed, skipping..."
fi

echo "We're done, enjoy."
