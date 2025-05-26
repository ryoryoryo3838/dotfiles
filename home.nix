{ config, pkgs, ... }:

{
  home.username = "miyax";
  home.homeDirectory = "/home/miyax";

  home.packages = [
    pkgs.vim
    pkgs.wget
    pkgs.git
    pkgs.gh

  ];
  
  imports = [
    ./config/zsh
  ];

  home.file = {
    ".vimrc".source = dots/vimrc;
    ".gitconfig".source = dots/gitconfig;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
