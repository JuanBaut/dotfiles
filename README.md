# dotfiles
![image](https://github.com/JuanBaut/dotfiles/assets/90160941/a776fc3f-8a46-448d-abe7-8f7c13b8bc72)

## I use too many things to list them here, but...
- Nvim is just better.
- Unix has always been better.
- Nothing is better than Zsh, Tmux and Alacritty together.
- MacOS as backup and Nixos for perfection in terms of productivity. 

Use this repo with stow.
```sh
stow -t "$HOME" .
```

Link neovim.
```sh
stow -t "$HOME" -S neovim
```

## Considerations
- ```./macos```:
    - Symlinks for files that can also be used on nixos
    - Files that have specific changes for macos
    - Custom icons.

I do this because I want to be able to have everything in one repo, and be linked by
stow, make changes to one (for example) .zshrc and have the changes shared
across nixos and macos.

- ```./xorg```:
    - X11 files that I might use if I go back to i3 in a hidpi laptop.

- ```./neovim/.config/nvim```:
    - Git submodule because I like having the repos and commit history separated but
    also stow it from the same dotfiles directory.

- My dependencies are managed by nixos and nix-darwin.
