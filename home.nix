{
  pkgs,
  ...
}:

{
  imports = [
    ./config/bash
    ./config/fastfetch
    ./config/flameshot
    ./config/ghostty
    ./config/spotify-player
    ./config/television
    ./config/vesktop
  ];

  ##########
  # Direnv #
  ##########
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };

  #######
  # Gtk #
  #######
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  ############
  # Programs #
  ############
  programs = {
    git = {
      enable = true;
      userName = "Aceroph";
      userEmail = "aos92@proton.me";
      extraConfig = {
        push = {
          autoSetupRemote = true;
        };
      };
    };
    java = {
      enable = true;
      package = (pkgs.jdk23.override { enableJavaFX = true; });
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
    nix-index = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  ############
  # Packages #
  ############
  home.packages = with pkgs; [
    android-studio
    blockbench
    cava
    (eiffel-studio-bin.overrideAttrs {
      libraries = [ eiffelPackages.game2 ];
    })
    fd
    firefox
    gimp
    graphviz-nox
    heroic
    jetbrains.idea-ultimate
    libreoffice-qt6-fresh
    libratbag
    libsixel
    mangohud
    nerd-fonts.d2coding
    piper
    postman
    postgresql_16
    prismlauncher
    qemu-user
    quickshell
    rainfrog # TUI for SQL
    spotify
    supabase-cli
    tmux
    wl-clicker
    xorg.xinit
    zen-browser
  ];

  ##############
  # Quickshell #
  ##############
  xdg.configFile."quickshell" = {
    source = ./config/quickshell;
    recursive = true;
  };

  ############
  # Services #
  ############
  services = {
    blueman-applet.enable = true;
    easyeffects.enable = true;
    spotifyd = {
      enable = true;
      settings.global = {
        device_name = "nixos";
        device_type = "computer";
      };
    };
  };

  home.stateVersion = "25.05";
}
