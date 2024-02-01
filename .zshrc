# --> --> --> dagger's zsh commands <-- <-- <--

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode)

ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_TMUX_AUTOSTART=false
ZLE_RPROMPT_INDENT=0

export PATH="$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

ALACRITTY="/mnt/c/Users/dagger/AppData/Roaming/alacritty"

# Aliases
alias c="clear"

alias nv="nvim"
alias config-nvim="cd && cd $HOME/box/nvim/lua/dagger/ && nv"

alias config-zsh="$EDITOR ~/.zshrc"
alias set-zsh="source ~/.zshrc"

alias config-tmux="$EDITOR ~/.tmux.conf"
alias set-tmux="tmux source ~/.tmux.conf"

alias config-alacritty="$EDITOR $HOME/box/dotfiles/alacritty/alacritty.toml"
alias set-alacritty="rm $ALACRITTY/alacritty.toml && cp $HOME/box/dotfiles/alacritty/alacritty.toml $ALACRITTY"
alias theme-alacritty="set-alacritty && cp $HOME/box/dotfiles/alacritty/theme.toml $ALACRITTY"

alias current-be="cd && cd dev/AppGuard/AppGuard-Back/back-end && ls -a"
alias current-fe="cd && cd dev/AppGuard/AppGuard-Front/front-end && ls -a"
alias dev="cd && cd dev/ && ls -a"
alias inpsql="sudo -u postgres psql"
alias fetchneo="neofetch --ascii $HOME/box/dotfiles/reaper.txt"
alias remove="rm -rf"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Update automatically without asking
zstyle ':omz:update' mode auto 

# oh-my-zsh place 
source $ZSH/oh-my-zsh.sh

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --> --> --> dagger's zsh commands <-- <-- <--
