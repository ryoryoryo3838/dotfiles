{ config, pkgs, ... }:

let
  nix-flatpak = builtins.fetchTarball "https://github.com/gmodena/nix-flatpak/archive/main.tar.gz";
in
{
  ### for flatpak
  imports = [
    "${nix-flatpak}/modules/home-manager.nix"
  ];
  
  services.flatpak = {
    enable = true;
  
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];

    packages = [
      "com.discordapp.Discord"
      "com.github.tchx84.Flatseal"
      "com.google.Chrome"
      "com.slack.Slack"
      "md.obsidian.Obsidian"
      "org.wezfurlong.wezterm"
      "org.zotero.Zotero"
      "us.zoom.Zoom"
    ];
    update.onActivation = true;
    };
  ###

  targets.genericLinux.enable = true;

  home.username = "miyax";
  home.homeDirectory = "/home/miyax";
  home.stateVersion = "25.11"; 

  home.sessionVariables.EDITOR = "nvim";

  # home.packages = [
  # ];
  #
  # home.file = {
  # };
  #
  programs.home-manager.enable = true;
}
