{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    kitty
    neovim
    tree
    btop
    wireguard-tools
    xournalpp
    kdePackages.dolphin
    kdePackages.kate
    discord
    teamspeak6-client
    element-desktop
    signal-desktop
    telegram-desktop
    kdePackages.gwenview
    libreoffice-qt-fresh
    kdePackages.okular
    thunderbird
    veracrypt
    vlc
  ];
  
  # set unfree predicate
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "teamspeak6-client"
    "veracrypt"
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
  programs.bash = {
    enable = true;
    initExtra = ''
      source ${../home/shell_functions/new-ts-dir.sh}
    '';
  };

  programs.joplin-desktop.enable = true;
  programs.element-desktop.enable = true;
  programs.firefox.enable = true;
}
