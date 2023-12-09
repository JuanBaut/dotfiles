# --> --> --> dagger's zsh commands <-- <-- <--

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting)

ZSH_TMUX_AUTOSTART=true
ZSH_THEME="powerlevel10k/powerlevel10k"

export PATH="$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

WIN="/mnt/c/Users/dagger/AppData/Roaming/alacritty"

# Aliases
alias nv="nvim"
alias config-nvim="$EDITOR $HOME/box/nvim/"

alias config-zsh="$EDITOR ~/.zshrc"
alias set-zsh="source ~/.zshrc"

alias config-tmux="$EDITOR ~/.tmux.conf"
alias set-tmux="tmux source ~/.tmux.conf"

alias config-alacritty="$EDITOR $HOME/box/dotfiles/alacritty/alacritty.yml"
alias clean-alacritty="rm $WIN/alacritty.yml"
alias copy-alacritty="cp $HOME/box/dotfiles/alacritty/alacritty.yml $WIN"
alias set-alacritty="clean-alacritty && copy-alacritty"

alias code="cd && cd dev/ && ls -a"
alias fetchneo="neofetch --ascii $HOME/box/dotfiles/reaper.txt"
alias remove="rm -rf"

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Update automatically without asking
zstyle ':omz:update' mode auto 

# oh-my-zsh place 
source $ZSH/oh-my-zsh.sh

# --> --> --> dagger's zsh commands <-- <-- <--
