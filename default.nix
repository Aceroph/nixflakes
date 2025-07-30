{
  quickshell-patched,
  nixos-hardware,
  home-manager,
  username,
  colors,
  pkgs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;
  imports = [
    nixos-hardware.nixosModules.asus-fx504gd
    home-manager.nixosModules.home-manager
    ./config/bluetooth
    ./config/greetd
    ./config/neovim
    ./config/nvidia
    ./config/obs
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
      "quiet"
      "splash"
      "loglevel=3"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    resumeDevice = "/dev/disk/by-uuid/788e5bc3-da21-4625-9c8d-368a5940bfff";
  };

  ##########################
  # Environmental packages #
  ##########################
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    nodejs_22
    ninja
    unzip
    htop
    zip
    gcc
    gh
  ];

  ##########
  # Flakes #
  ##########
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

  ################
  # Home manager #
  ################
  home-manager = {
    extraSpecialArgs = { inherit quickshell-patched username colors; };
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
    flatpak.enable = true;
    logind.lidSwitch = "hibernate";
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
    ratbagd.enable = true;
    tailscale.enable = true;
    upower.enable = true;
    xserver.xkb = {
      layout = "us,ca";
      variant = ",multix";
      options = "grp:alt_shift_toggle";
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
    config.common.default = "wlr";
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };

  system.stateVersion = "25.11";
}
