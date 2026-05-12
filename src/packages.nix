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
  ]
  ++
  (with kdePackages; [
    # essential kde
    kscreen
    kwallet
  ]);
  
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
  programs.bash = let
    shell_functions = ../home/shell_functions;
  in {
    enable = true;
    initExtra = ''
      source ${shell_functions}/new-ts-dir.sh
      source ${shell_functions}/source-home-manager.sh
    '';
  };

  programs.joplin-desktop.enable = true;
  programs.element-desktop.enable = true;
  programs.firefox.enable = true;
}
