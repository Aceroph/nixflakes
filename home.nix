{
  lib,
  pkgs,
  quickshell,
  ...
}:

{

  #######
  # Gtk #
  #######
  gtk = {
    enable = true;
    theme = pkgs.gnome-extra-themes;
  };

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
    quickshell.packages.x86_64-linux.default
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
    initContent =
      let
        async-prompt = lib.mkOrder 500 "zstyle ':omz:alpha:lib:git' async-prompt force";
        zoxide-init = lib.mkOrder 1000 "eval \"$(zoxide init zsh)\"";
      in
      lib.mkMerge [
        async-prompt
        zoxide-init
      ];
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.oh-my-zsh";
      theme = "custom";
    };
    shellAliases = {
      cd = "z";
    };
  };

  home.stateVersion = "25.05";
}
