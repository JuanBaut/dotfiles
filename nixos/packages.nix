{ pkgs, ... }:
let unstable = import <nixos-unstable> { };
in {
  environment.systemPackages = with pkgs; [
    unstable.alacritty
    keepassxc
    fastfetch
    neofetch
    cbonsai
    unzip
    btop
    tmux
    git
    eza
    fzf
    zsh
    fd

    i3lock-color
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

    xfce.ristretto
    xfce.tumbler
    xfce.thunar

    ungoogled-chromium
    discord
    spotify
  ];
}
