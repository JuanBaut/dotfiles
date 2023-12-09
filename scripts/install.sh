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

echo "----------------------------------------"

# Neovim
PS3="Install neovim config? "
opt_neovim=("Yes" "No" "Quit")
select opt in "${opt_neovim[@]}"; do
    case $opt in
        "Yes")
            echo -e "\nCloning dagger's neovim repo and creating symlink in $XDG_CONFIG_HOME\n"
            git clone git@github.com:JuanBaut/nvim.git /"$BOX"/nvim

            if [ -d /"$XDG_CONFIG_HOME/nvim" ]; then
                sudo rm -r /"$XDG_CONFIG_HOME"/nvim
            fi

            ln -sf "$BOX/nvim" "$XDG_CONFIG_HOME/nvim"
            break
            ;;
        "No")
            echo -e "\nSkipping Neovim...\n"
            break
            ;;
        "Quit")
            echo -e "\nNothing done, exiting script\n"
            exit 0
            ;;
        *)
            echo -e "\nInvalid option. Please try again.\n"
            ;;
    esac
done

echo "----------------------------------------"

# oh-my-zsh!
PS3="Install oh-my-zsh? "
opt_omz=("Yes" "No" "Quit")
select opt in "${opt_omz[@]}"; do
    case $opt in
        "Yes")
            echo -e "\nInstalling oh-my-zsh!\n"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            break
            ;;
        "No")
            echo -e "\nSkipping oh-my-zsh...\n"
            break
            ;;
        "Quit")
            echo -e "\nNothing done, exiting script\n"
            exit 0
            ;;
        *)
            echo -e "\nInvalid option. Please try again.\n"
            ;;
    esac
done

echo "----------------------------------------"

# p10k shell prompt
PS3="Install powerlevel10k? "
opt_p10k=("Yes" "No" "Quit")
select opt in "${opt_p10k[@]}"; do
    case $opt in
        "Yes")
            echo -e "\nInstalling powerlevel10k\n"
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
            break
            ;;
        "No")
            echo -e "\nSkipping powerlevel10k...\n"
            break
            ;;
        "Quit")
            echo -e "\nNothing done, exiting script\n"
            exit 0
            ;;
        *)
            echo -e "\nInvalid option. Please try again.\n"
            ;;
    esac
done

echo "----------------------------------------"

# zsh-syntax-highlighting
PS3="Install zsh-syntax-highlighting? "
opt_zsh_syntax=("Yes" "No" "Quit")
select opt in "${opt_zsh_syntax[@]}"; do
    case $opt in
        "Yes")
            echo -e "\nInstalling zsh-syntax-highlighting\n"
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
            break
            ;;
        "No")
            echo -e "\nSkipping zsh-syntax-highlighting...\n"
            break
            ;;
        "Quit")
            echo -e "\nNothing done, exiting script\n"
            exit 0
            ;;
        *)
            echo -e "\nInvalid option. Please try again.\n"
            ;;
    esac
done

echo "----------------------------------------"

# zsh-autosuggestions
PS3="Install zsh-autosuggestions? "
opt_zsh_auto=("Yes" "No" "Quit")
select opt in "${opt_zsh_auto[@]}"; do
    case $opt in
        "Yes")
            echo -e "\nInstalling zsh-autosuggestions\n"
            git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
            break
            ;;
        "No")
            echo -e "\nSkipping zsh-syntax-highlighting...\n"
            break
            ;;
        "Quit")
            echo -e "\nNothing done, exiting script\n"
            exit 0
            ;;
        *)
            echo -e "\nInvalid option. Please try again.\n"
            ;;
    esac
done

echo "----------------------------------------"

# .zshrc
PS3="Replace .zshrc? "
opt_zsh=("Yes" "No" "Quit")
select opt in "${opt_zsh[@]}"; do
    case $opt in
        "Yes")
            echo -e "\nCreating symlink for .zshrc in $HOME\n"
            if [ -f "/$HOME/.zshrc" ]; then
                rm "/$HOME/.zshrc"
            fi
            ln -sf "$DOTFILES/.zshrc" "$HOME"

            break
            ;;
        "No")
            echo -e "\nSkipping .zshrc...\n"
            break
            ;;
        "Quit")
            echo -e "\nNothing done, exiting script\n"
            exit 0
            ;;
        *)
            echo -e "\nInvalid option. Please try again.\n"
            ;;
    esac
done

echo "----------------------------------------"

# Tmux
PS3="Install config and plugin manager for Tmux? "
opt_tmux=("Yes" "No" "Quit")
select opt in "${opt_tmux[@]}"; do
    case $opt in
        "Yes")
            echo -e "\nCreating symlink for tmux config in $HOME\n"
            git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
            if [ -f "/$HOME/.tmux.conf" ]; then
                rm "/$HOME/.tmux.conf"
            fi
            ln -sf "$DOTFILES/.tmux.conf" "$HOME"

            break
            ;;
        "No")
            echo -e "\nSkipping Tmux setup...\n"
            break
            ;;
        "Quit")
            echo -e "\nNothing done, exiting script\n"
            exit 0
            ;;
        *)
            echo -e "\nInvalid option. Please try again.\n"
            ;;
    esac
done

echo "----------------------------------------"

# Nvm
PS3="Install Nvm? "
opt_nvm=("Yes" "No" "Quit")
select opt in "${opt_nvm[@]}"; do
    case $opt in
        "Yes")
            echo -e "\nChecking if nvm is already installed and then installing nvm in case it isn't\n"
            if ! command -v nvm >/dev/null; then
                curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
            else
                echo -e "\nNvm is already installed, skipping...\n"
            fi

            break
            ;;
        "No")
            echo -e "\nSkipping Nvm install...\n"
            break
            ;;
        "Quit")
            echo -e "\nNothing done, exiting script\n"
            exit 0
            ;;
        *)
            echo -e "\nInvalid option. Please try again.\n"
            ;;
    esac
done

echo "----------------------------------------"
echo -e "\nWe're done, get coding.\n"
