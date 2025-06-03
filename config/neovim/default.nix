{ config, lib, pkgs, ... }:

{
  pkgs.neovim.override {
    configure = {
      with-clipboard = true;
    };
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
  }; 
}
