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
    in ({
    EDITOR = "nvim";
    HOME_MANAGER = "/var/configurations/home-manager/";
    HOST_CONFIG = "/var/configurations/host/";
  } // 
  lib.attrsets.mapAttrs (name: value: "${homeDir}/${value}") {
    # home tree directories
    KDE_APPLICATIONS = ".local/share/applications";
    HOME = "";
    LAB = "lab";
    DEV = "dev";
    TODO = "TODO";
    NOTES = "notes";
    MEETINGS = "meetings";
    DOCUMENTS = "documents";
    DOWNLOADS = "downloads";
    FILES = "files";
    MEDIA = "files/media";
    DOCS = "docs";

    # more time-bound project files installation
    JOB_PORTAL = "job_portal";
  });


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
