{
  desktop,
  username,
  pkgs,
  ...
}:

{
  imports = [
    ./${desktop}
    ./alacritty
  ];
  home-manager = {
    users.${username} = {
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
        nerd-fonts.d2coding
        jetbrains.idea-ultimate
        jetbrains.webstorm
        jetbrains.clion
        graphviz-nox
        valgrind
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
        firefox

        # Peripherals
        libratbag
        piper
      ];
      home.stateVersion = "25.05";
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Use nix flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.initrd.systemd.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "resume_offset=21618688" ];
  boot.resumeDevice = "/dev/disk/by-uuid/788e5bc3-da21-4625-9c8d-368a5940bfff";

  powerManagement.enable = true;

  # Networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Time and localisation
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    nodejs_22
    unzip
    ninja
    xclip
    htop
    zip
    gcc
    gh
  ];

  services = {
    openssh.enable = true;
    ratbagd.enable = true;
    tailscale.enable = true;
    xserver.excludePackages = with pkgs; [
      xterm
    ];
    printing.enable = true;
    xserver.xkb = {
      layout = "us,ca";
      variant = ",multix";
      options = "grp:alt_shift_toggle";
    };
  };

  system.stateVersion = "25.05";
}
