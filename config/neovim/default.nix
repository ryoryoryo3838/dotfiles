{ config, lib, pkgs, ... }:

let myNeovim = pkgs.neovim.override {
    configure = {
      withClipboard = true;
    };
  };
in
{
  programs.neovim = {
    enable = true;
    package = myNeovim;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
  }; 
}
