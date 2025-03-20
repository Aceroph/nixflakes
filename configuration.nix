{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Users
  users.users.acero = {
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [ "wheel" ];
  };

  # Use nix flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nvidia
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:1:0";
      nvidiaBusId = "PCI:0:0:2";
    };
  };

  # Networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Time and localisation
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  security.rtkit.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    seahorse
    cheese
    geary
    gedit
  ];

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    nodejs_22
    unzip
    ninja
    xclip
    zip
    gcc
    gh
  ];

  services = {
    openssh.enable = true;
    ratbagd.enable = true;
    tailscale.enable = true;
    xserver = {
      enable = true;
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          i3blocks
        ];
      };
      displayManager = {
        defaultSession = "none+i3";
      };
      desktopManager = {
        xterm.enable = false;
      };
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
  };

  system.stateVersion = "25.05";
}
