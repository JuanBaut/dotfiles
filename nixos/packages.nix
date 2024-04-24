{ pkgs, lib, ... }:
let
  unstable = import <nixos-unstable> {
    config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [ "spotify" ];
  };
in {
  environment.systemPackages = with pkgs; [
    unstable.alacritty
    unstable.keepassxc
    fastfetch
    neofetch
    cbonsai
    ripgrep
    unzip
    btop
    tmux
    wget
    tldr
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
    unstable.spicetify-cli
    unstable.spotify
    discord
  ];
}
