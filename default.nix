{
  colors,
  home-manager,
  nixos-hardware,
  pkgs,
  quickshell,
  steelwm,
  username,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  imports = [
    home-manager.nixosModules.home-manager
    nixos-hardware.nixosModules.asus-fx504gd
    steelwm.nixosModules.steelwm
    ./config/bluetooth
    ./config/sddm
    ./config/neovim
    ./config/nvidia
    ./config/obs
    ./config/steelwm
    ./config/tmux
    ./hardware-configuration.nix
  ];

  ###########
  # Battery #
  ###########
  powerManagement.enable = true;

  ########
  # Boot #
  ########
  boot = {
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    kernelParams = [
      "loglevel=2"
      "mem_sleep_default=deep"
      "resume_offset=21618688"
      "quiet"
      "splash"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "nixos";
      themePackages = [ (pkgs.callPackage ./config/plymouth/default.nix { }) ];
    };
  };

  ##########################
  # Environmental packages #
  ##########################
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    unzip
    dmenu
    htop
    zip
    gh
  ];

  ##########
  # Flakes #
  ##########
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  #########
  # Fonts #
  #########
  fonts.packages = with pkgs; [ scientifica ];

  ##########
  # Gaming #
  ##########
  programs = {
    dconf.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  ###############
  # Hibernation #
  ###############
  boot.resumeDevice = "/dev/disk/by-uuid/788e5bc3-da21-4625-9c8d-368a5940bfff";
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  ################
  # Home manager #
  ################
  home-manager = {
    extraSpecialArgs = {
      inherit
        colors
        quickshell
        steelwm
        username
        ;
    };
    useGlobalPkgs = true;
    users.${username} = {
      imports = [
        ./home.nix
      ];
    };
  };

  ################
  # Localisation #
  ################
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  ##############
  # Networking #
  ##############
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  ############
  # Security #
  ############
  security.rtkit.enable = true;

  ############
  # Services #
  ############
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    dbus.packages = with pkgs; [ pass-secret-service ];
    flatpak.enable = true;
    libinput.enable = true;
    logind = {
      lidSwitch = "hibernate";
      powerKey = "hibernate";
      powerKeyLongPress = "poweroff";
    };
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    power-profiles-daemon.enable = true;
    printing.enable = true;
    ratbagd.enable = true;
    tailscale.enable = true;
    upower.enable = true;
    xserver = {
      enable = true;
      enableTearFree = true;
      xkb = {
        layout = "us,ca";
        variant = ",multix";
        options = "grp:alt_shift_toggle";
      };
    };
  };

  #########
  # Shell #
  #########
  programs = {
    zsh.enable = true; # See home.nix for the actual config
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
  users.defaultUserShell = pkgs.zsh;

  ###########
  # Systemd #
  ###########
  systemd = {
    packages = with pkgs; [ pass-secret-service ];
    sleep.extraConfig = ''
      HibernateDelaySec=30m
      SuspendState=mem
    '';
  };

  #########
  # Users #
  #########
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [
      "input"
      "wheel"
      "audio"
    ];
  };

  ######################
  # XDG Desktop Portal #
  ######################
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal
    ];
  };

  system.stateVersion = "25.11";
}
