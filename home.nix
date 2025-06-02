{ config, pkgs, ... }:

{
  home.username = "miyax";
  home.homeDirectory = "/home/miyax";

  home.packages = [
    pkgs.vim
    pkgs.wget
    pkgs.git
    pkgs.gh

    pkgs.zsh
    pkgs.bat
    pkgs.eza
    pkgs.zoxide
    pkgs.fzf

    pkgs.direnv

    pkgs.libgcc
    pkgs.nodejs_24
  
  ];
  
  imports = [
    ./config/zsh
    ./config/neovim
    ./config/direnv
  ];

  home.file = {
    ".vimrc".source = dots/vimrc;
    ".gitconfig".source = dots/gitconfig;
    ".bashrc".source = dots/bashrc;
    ".profile".source = dots/profile;
    ".config/nixpkgs" = {
      source = config/nixpkgs;
      recursive = true;
    };
    ".config/nvim" = {
      source = config/neovim/nvim;
      recursive = true;
    };
  };


  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
