{ config, pkgs, lib, ... }:

{
  imports = [ 
    ./files.nix 
    ./packages.nix
  ];


  home.username = "frey";
  home.homeDirectory = "/home/frey";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.sessionVariables = 
    let
      homeDir = config.home.homeDirectory;
    in {
    EDITOR = "nvim";
    lab = "${homeDir}/lab";
    home-manager = "${homeDir}/.config/home-manager";
    job-portal = "${homeDir}/job_portal";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
