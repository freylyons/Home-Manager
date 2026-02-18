{ config, pkgs, lib, ... }:

{
  imports = [ ./files.nix ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "frey";
  home.homeDirectory = "/home/frey";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    kitty
    neovim
    tree
    btop
    xournalpp
    kdePackages.dolphin
    kdePackages.kate
    steam
    discord
  ];
  
  # set unfree predicate
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
    "discord"
  ];


  # git settings
  programs.git = {
    enable = true;

    settings = {
      user = {
        email = "freylyons@hotmail.co.uk";
        name = "Frey lyons";
      };

      pull.rebase = true;  
    };
  };

  # shell settings
  programs.bash.enable = true;

  programs.joplin-desktop.enable = true;
  programs.element-desktop.enable = true;
  programs.firefox.enable = true;


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/frey/etc/profile.d/hm-session-vars.sh
  #
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
