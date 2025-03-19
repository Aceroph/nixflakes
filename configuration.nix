{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
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
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
	  xserver.enable = true;
	  xserver.displayManager.gdm.enable = true;
	  xserver.desktopManager.gnome.enable = true;
  	  xserver.videoDrivers = ["nvidia"];
	  xserver.excludePackages = with pkgs; [
		xterm
	  ];
	  xserver.xkb = {
		layout = "us";
		variant = "";
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
