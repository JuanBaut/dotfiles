{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { };
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in {
  imports = [ (import "${home-manager}/nixos") ];

  home-manager.backupFileExtension = "backup";

  home-manager.users.dagger = { pkgs, ... }: {
    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
    fonts.fontconfig.enable = true;

    home.pointerCursor = {
      name = "macOS-Monterey";
      package = pkgs.apple-cursor;
      size = 36;
    };

    gtk = {
      enable = true;
      font = {
        name = "Work Sans";
        size = 10;
        package = pkgs.work-sans;
      };
      theme = {
        name = "Colloid-Dark";
        package = pkgs.colloid-gtk-theme;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    qt = {
      enable = true;
      platformTheme = "gtk3";
    };

    programs.git = {
      enable = true;
      userEmail = "deserd@protonmail.com";
      userName = "JuanBaut";
    };
  };

  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    shadow = true;
    fade = true;
    fadeDelta = 3;
    inactiveOpacity = 0.6;
    opacityRules = [ "100:class_g *?= 'rofi'" "100:class_g *?= 'firefox'" ];
    settings = { corner-radius = 12; };
  };

  fonts.packages = with pkgs; [
    (unstable.nerdfonts.override { fonts = [ "JetBrainsMono" "GeistMono" ]; })
    work-sans
  ];

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    colloid-gtk-theme
    apple-cursor
  ];
}
