{ pkgs, ... }:
let unstable = import <nixos-unstable> { };
in {
  environment.systemPackages = with pkgs; [
    unstable.bun
    unstable.nodejs_21
    nodePackages_latest.prettier
    nodePackages_latest.eslint
    unstable.eslint_d
    nodePackages_latest.vscode-html-languageserver-bin
    nodePackages_latest.vscode-css-languageserver-bin
    nodePackages_latest.typescript-language-server
    tailwindcss-language-server
    typescript

    sumneko-lua-language-server
    stylua
    lua

    nodePackages_latest.pyright
    black
    mypy
    ruff

    shellcheck
    beautysh

    nixfmt
    nil
    gcc
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = unstable.neovim-unwrapped;
  };
}
