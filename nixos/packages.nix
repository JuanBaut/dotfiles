{ pkgs, ... }:
let unstable = import <nixos-unstable> { };
in {
  environment.systemPackages = with pkgs; [
    unstable.alacritty
    keepassxc
    fastfetch
    neofetch
    unzip
    btop
    tmux
    git
    eza
    fzf
    zsh
    fd

    imagemagick
    playerctl
    xidlehook
    scrot

    brightnessctl
    pavucontrol
    polybarFull
    libnotify
    dunst
    xclip
    xsel
    rofi
    feh
  ];
}
