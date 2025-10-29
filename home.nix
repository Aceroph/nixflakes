{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
    ./config/bash
    ./config/dunst
    ./config/fastfetch
    ./config/foot
    ./config/fuzzel
    ./config/niri
    ./config/quickshell
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
    zen-browser.enable = true;
  };

  ############
  # Packages #
  ############
  home.packages = with pkgs; [
    alsa-utils
    android-studio
    blockbench
    drawio
    (eiffel-studio-bin.overrideAttrs {
      libraries = [ eiffelPackages.game2 ];
    })
    fd
    firefox
    gimp
    heroic
    jetbrains.datagrip
    jetbrains.idea-ultimate
    libnotify
    libreoffice-qt6-fresh
    libratbag
    libsixel
    mangohud
    nerd-fonts.d2coding
    piper
    postman
    postgresql_16
    prismlauncher
    qemu
    rainfrog # TUI for SQL
    spotify
    swaybg
    tmux
    wireshark
    wl-clicker
    xwayland-satellite
  ];

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
