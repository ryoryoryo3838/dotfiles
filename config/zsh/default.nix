{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;   
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
    initContent = ''
      # Lines configured by zsh-newuser-install
      HISTFILE=~/.history/zsh_history
      HISTSIZE=1000
      SAVEHIST=1000
      setopt autocd beep nomatch
      bindkey -v
      # End of lines configured by zsh-newuser-install
      # The following lines were added by compinstall
      zstyle :compinstall filename '/home/miyax/.zshrc'

      autoload -Uz compinit
      compinit
      # End of lines added by compinstall
    '';
  };
}
