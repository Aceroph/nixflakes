{ desktop, pkgs, ... }:

{
  imports = [
    ./${desktop}
    ./starship
    ./neovim
    ./bars
  ];

  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    userName = "Aceroph";
    userEmail = "aos92@proton.me";
  };

  # BETTER LS COMMAND
  programs.lsd = {
    enable = true;
    settings = {
      layout = "tree";
      recursion = {
        enabled = true;
        depth = 5;
      };
    };
  };

  programs.java = {
    enable = true;
    package = pkgs.jetbrains.jdk;
  };

  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    # Coding
    nerd-fonts.gohufont
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.clion
    graphviz-nox
    valgrind
    ghostty
    tmux

    # Gaming
    heroic
    prismlauncher
    mangohud

    # Entertainement
    discord
    gimp
    spotify
    libreoffice-qt6-fresh

    # Peripherals
    libratbag
    piper
    firefox
  ];

  home.stateVersion = "25.05";
}
