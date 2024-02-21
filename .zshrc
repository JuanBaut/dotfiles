# --> --> --> dagger's zsh commands <-- <-- <--

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(git zsh-syntax-highlighting)

ZSH_THEME="powerlevel10k/powerlevel10k"
ZLE_RPROMPT_INDENT=0
# ZSH_TMUX_AUTOSTART=false

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
alias f='cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv --max-depth 2 | fzf)'
alias dev='cd ~/dev && cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv --max-depth 2 | fzf)'
alias box='cd ~/box && cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv --max-depth 2 | fzf)'
alias nv="nvim"

alias config-zsh="$EDITOR ~/.zshrc"
alias set-zsh="source ~/.zshrc"

alias config-tmux="$EDITOR ~/.tmux.conf"
alias set-tmux="tmux source ~/.tmux.conf"

alias config-alacritty="$EDITOR $HOME/box/dotfiles/alacritty/alacritty.toml"
alias set-alacritty="rm $ALACRITTY/alacritty.toml && cp $HOME/box/dotfiles/alacritty/alacritty.toml $ALACRITTY"
alias theme-alacritty="set-alacritty && cp $HOME/box/dotfiles/alacritty/theme.yml $ALACRITTY"

alias inpsql="sudo -u postgres psql"
alias fetchneo="neofetch --ascii $HOME/box/dotfiles/reaper.txt"

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
