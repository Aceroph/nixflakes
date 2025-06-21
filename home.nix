{ lib, pkgs, ... }:

{
  ############
  # Programs #
  ############
  programs = {
    git = {
      enable = true;
      userName = "Aceroph";
      userEmail = "aos92@proton.me";
    };

    lsd = {
      enable = true;
      settings = {
        layout = "tree";
        recursion = {
          enabled = true;
          depth = 2;
        };
      };
    };

    java = {
      enable = true;
      package = pkgs.jetbrains.jdk;
    };
  };

  ############
  # Services #
  ############
  services = {
    easyeffects.enable = true;
    blueman-applet.enable = true;
  };

  ############
  # Packages #
  ############
  home.packages = with pkgs; [
    # Coding
    nerd-fonts.d2coding
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.clion
    graphviz-nox
    valgrind
    tmux

    # Gaming
    wl-clicker
    heroic
    prismlauncher
    mangohud

    # Entertainement
    discord
    gimp
    spotify
    libreoffice-qt6-fresh
    firefox

    # Peripherals
    libratbag
    piper
  ];

  #########
  # Shell #
  #########
  home.file.".oh-my-zsh/themes/custom.zsh-theme".text = builtins.readFile ./theme.zsh-theme;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = lib.mkOrder 600 "zstyle ':omz:alpha:lib:git' async-prompt force";
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.oh-my-zsh";
      theme = "custom";
    };
  };

  home.stateVersion = "25.05";
}
