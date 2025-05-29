{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;   
    syntaxHighlighting.enable = true;
    shellAliases = {
      cat = "bat";
      ls = "eza";
      hm = "home-manager switch --file /home/miyax/dotfiles/home.nix";
      sync = "git add . && git commit --allow-empty && git push";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "aliases" 
        "copyfile"
      ];
      theme = "robbyrussell";
    };
    initContent = ''
      # Lines configured by zsh-newuser-install
      HISTFILE=~/.history/zsh_history
      HISTSIZE=1000
      SAVEHIST=1000
      bindkey -v
      # End of lines configured by zsh-newuser-install
      # The following lines were added by compinstall
      zstyle :compinstall filename '/home/miyax/.zshrc'

      autoload -Uz compinit
      compinit
      # End of lines added by compinstall
      eval "$(zoxide init zsh)"

      branch(branch) {
        git add .
        git commit --allow-empty
        git push -u origin $branch
      }
    '';
  };
}
