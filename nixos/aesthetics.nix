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
      size = 40;
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

    programs.git = {
      enable = true;
      userEmail = "deserd@protonmail.com";
      userName = "JuanBaut";
    };
  };

  qt = {
    enable = true;
    style = "gtk2";
    platformTheme = "gtk2";
  };

  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    shadow = true;
    fade = true;
    fadeDelta = 3;
    inactiveOpacity = 0.8;
    shadowExclude = [ "class_g *?= 'polybar'" ];
    opacityRules = [ "100:class_g *?= 'rofi'" "100:class_g *?= 'firefox'" ];
    settings = {
      corner-radius = 12;
      blur = {
        method = "dual_kawase";
        size = 10;
        deviation = 5.0;
      };
    };
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
