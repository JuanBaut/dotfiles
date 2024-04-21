{ pkgs, ... }:
let unstable = import <nixos-unstable> { };
in {
  environment.systemPackages = with pkgs; [
    unstable.bun
    unstable.nodejs_21
    unstable.eslint_d
    unstable.prettierd
    nodePackages_latest.eslint
    nodePackages_latest.prettier
    vscode-langservers-extracted
    tailwindcss-language-server
    nodePackages_latest.typescript-language-server
    typescript

    sumneko-lua-language-server
    stylua
    lua

    python3
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
