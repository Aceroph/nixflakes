{ pkgs, ... }:

{
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

  services = {
    easyeffects.enable = true;
    blueman-applet.enable = true;
  };

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
  home.stateVersion = "25.05";
}
