#!/bin/bash

# --> --> --> dagger's install script <-- <-- <--

set -e

echo "-> Creating box directory"
cd
mkdir box

BOX="/$HOME/box"
CONFIG_FILES="/$HOME/.config"

# Neovim
echo "-> Cloning dagger's neovim repo and creating symlink in $CONFIG_FILES"

git clone https://github.com/JuanBaut/nvim.git /$BOX/nvim && echo "-> Success" || (echo "-> Failed"; exit 1)

if [ -d /$CONFIG_FILES/nvim ]; then
  rm -r /$CONFIG_FILES/nvim
fi

cd
ln -sf /home/dagger/box/nvim /home/dagger/.config/nvim && echo "-> Success" || (echo "-> Failed"; exit 1)

# oh-my-zsh! 
echo "-> Installing oh-my-zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo "-> Success" || (echo "-> Failed"; exit 1)

# p10k shell prompt
echo "-> Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && echo "-> Success" || (echo "-> Failed"; exit 1)

# zsh-syntax-highlighting
echo "-> Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && echo "-> Success" || (echo "-> Failed"; exit 1)

# zsh-autosuggestions
echo "-> Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "-> Success" || (echo "-> Failed"; exit 1)

# .zshrc
echo "-> Creating symlink for .zshrc in $HOME"
if [ -f /$HOME/.zshrc ]; then
  rm /$HOME/.zshrc
fi

ln -sf /home/dagger/.zshrc /home/dagger/ && echo "-> Success" || (echo "-> Failed"; exit 1)

# Kitty
echo "-> Creating symlink for kitty terminal config files in $CONFIG_FILES"
if [ -d /$CONFIG_FILES/kitty ]; then
  rm -r /$CONFIG_FILES/kitty
fi

ln -sf  /home/dagger/dotfiles/kitty /home/dagger/.config/kitty && echo "-> Success" || (echo "-> Failed"; exit 1)

# Tmux
echo "-> Creating symlink for tmux config in $HOME"
if [ -f /$HOME/.tmux.conf ]; then
  mv /$HOME/.tmux.conf /$HOME/.tmux.conf.backup 
fi

ln -sf /home/dagger/dotfiles/.tmux.conf /home/dagger/ && echo "-> Success" || (echo "-> Failed"; exit 1)

# Nvm
echo "-> Checking if nvm is already installed and then installing nvm in case it is'nt"
if ! command -v nvm >/dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && echo "-> Success" || (echo "-> Failed"; exit 1)
else
  echo "-> nvm is already installed, skipping..."
fi

echo "-> We're done, enjoy."
