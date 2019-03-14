{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.keyboard.layout = "br";

  home.packages = with pkgs; with haskellPackages; [
    nitrogen
    xmonad xmonad-extras xmonad-contrib
  ];

  home.file = {
    ".scripts/change-keyboard.sh".source = ./scripts/change-keyboard.sh;
    ".scripts/prompt.sh".source = ./scripts/prompt.sh;
    ".scripts/change-monitor.sh".source = ./scripts/change-monitor.sh;
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager = {
      enable = true;
      path = "…";
    };

    git = {
      enable = true;
      userName = "Guilherme";
      userEmail = "guilhermehas@hotmail.com";
    };

    fish = {
      enable = true;
      interactiveShellInit = builtins.readFile ./config/config.fish;
    };
      
    vim = {
      enable = true;
      extraConfig = builtins.readFile ./config/vimrc;
    };
  };

  xsession.enable = false;
  xsession.windowManager.xmonad = {
      enable = true;
      config = ./config/xmonad.hs;
      extraPackages = haskellPackages: with haskellPackages; [
        xmonad-contrib
        xmonad-extras
        xmonad
      ];
  };
}
