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

  # Use nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  
  # Time and localisation
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  security.rtkit.enable = true;

  users.users.acero = {
    isNormalUser = true;
    description = "Jonathan Pilotte";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
		# Gaming
		heroic-unwrapped
		prismlauncher
		mangohud
		steam
			
		# Entertainement
		discord
		gimp
		spotify
		libreoffice-qt6-fresh
		
		# Peripherals
		libratbag
		easyeffects
		piper
		
		# Terminal
		tmux
		ghostty
		fira-code-nerdfont

		# Coding
		jetbrains-toolbox
		greenfoot
	];
  };


  # Exclude built-in packages
  services.xserver.excludePackages = with pkgs; [
  	xterm
  ];

  # Exclude gnome packages
  environment.gnome.excludePackages = with pkgs; [
	epiphany
	seahorse
	cheese
  	geary
	gedit
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Install gamemode
  programs.gamemode.enable = true;

  # Noisetorch
  programs.noisetorch.enable = true;

  # Java with JavaFX
  programs.java = {
    enable = true;
    package = (pkgs.jdk23.override { enableJavaFX = true; });
  };

  # Install steam
  programs.steam = {
  	enable = true;
	remotePlay.openFirewall = true;
	dedicatedServer.openFirewall = true;
	localNetworkGameTransfers.openFirewall = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable # Wine
	nodejs_22
	direnv
	unzip
	ninja
	xclip # Clipboard provider
	zip
	gcc
	git
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
