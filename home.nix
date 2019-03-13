{ config, pkgs, ... }:

{
  home.keyboard.layout = "br";

  home.packages = with pkgs; with haskellPackages; [
    xmonad xmonad-extras xmonad-contrib
  ];

  home.file = {
    ".scripts/change-keyboard.sh".source = ./scripts/change-keyboard.sh;
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
      interactiveShellInit = ''
        set EDITOR "nvim"

        alias pbcopy "xclip -selection clipboard"
        alias pbpaste "xclip -selection clipboard -o"

        set fishlocation "~/.config/fish/config.fish"
        alias fish-location "$fishlocation"
        alias fish-reload "source $fishlocation"
        alias fish-edit "nvim $fishlocation"

        alias chrome "google-chrome-stable"

        alias default-chrome "sed -i -e 's/$firefoxname/$chromename/g' $mimemappslocation"
        alias default-firefox "sed -i -e 's/$chromename/$firefoxname/g' $mimemappslocation"

        alias ssh-flavio "ssh guilherme@200.20.164.152"

        alias nixos-edit "sudoedit /etc/nixos/configuration.nix"

        alias config 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
      '';
      
      vim = {
        enable = true;
        extraConfig = ''
          set tabstop=2
          set shiftwidth=2
          set expandtab
        '';
      };
    };
  };

  xsession.enable = false;
  xsession.windowManager.xmonad = {
      enable = true;
      config = ./config/xmonad.hs;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
  };
}
