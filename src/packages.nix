{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    kitty
    neovim
    tree
    btop
    xournalpp
    kdePackages.dolphin
    kdePackages.kate
    discord
    element-desktop
    signal-desktop
    telegram-desktop
    kdePackages.gwenview
  ];
  
  # set unfree predicate
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
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
}
