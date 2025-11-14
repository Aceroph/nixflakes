{
  inputs,
  pkgs,
  username,
  ...
}:

{
  imports = [
    inputs.niri.nixosModules.niri
    inputs.nixos-hardware.nixosModules.asus-fx504gd
    ./config/bluetooth
    ./config/grub
    ./config/neovim
    ./config/nvidia
    ./config/obs
    ./config/sddm
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
    blacklistedKernelModules = [ "nouveau" ];
    binfmt.emulatedSystems = [ "armv7l-linux" ];
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
    plymouth = {
      enable = true;
      theme = "nixos";
      themePackages = [ (pkgs.callPackage ./config/plymouth/default.nix { }) ];
    };
  };

  #################
  # Environmental #
  #################
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      gcc
      gh
      gnumake
      htop
      unzip
      wineWowPackages.stable
      zip
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ inputs.niri.overlays.niri ];
  };

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
  fonts.packages = with pkgs; [
    scientifica
    (google-fonts.override { fonts = [ "Sono" ]; })
  ];

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
    firewall.checkReversePath = "loose";
  };

  ##############
  # Nix Helper #
  ##############
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/${username}/.config/nixos";
  };

  ############
  # Programs #
  ############
  programs = {
    dconf.enable = true;
    gamemode.enable = true;
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    wireshark = {
      enable = true;
      dumpcap.enable = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
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
    logind.settings.Login = {
      HandleLidSwitch = "hibernate";
      HandlePowerKey = "hibernate";
      HandlePowerKeyLongPress = "poweroff";
    };
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    postgresql = {
      enable = true;
      enableTCPIP = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust

        # ipv4
        host  all       all     127.0.0.1/32      trust
        host  all       all     ::1/128           trust
      '';
    };
    power-profiles-daemon.enable = true;
    printing.enable = true;
    ratbagd.enable = true;
    tailscale.enable = true;
    upower.enable = true;
  };

  ###########
  # Systemd #
  ###########
  systemd = {
    packages = with pkgs; [ pass-secret-service ];
    sleep.extraConfig = ''
      HibernateDelaySec=30m
      SuspendState=mem
    '';
    services.snx-rs = {
      enable = true;
      path = [
        pkgs.iproute2
        pkgs.kmod
        pkgs.networkmanager
      ];
      description = "SNX-RS VPN client for Linux";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.snx-rs}/bin/snx-rs -m command -l debug";
        Type = "simple";
      };
    };
  };

  #########
  # Users #
  #########
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [
      "audio"
      "input"
      "wheel"
      "wireshark"
    ];
  };

  ######################
  # XDG Desktop Portal #
  ######################
  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  system.stateVersion = "25.11";
}
