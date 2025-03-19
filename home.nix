{ config, pkgs, ... }:

{
	imports = [ ./modules/neovim.nix ];

	programs.git = {
		enable = true;
		userName = "Aceroph";
		userEmail = "aos92@proton.me";
	};

	home.packages = with pkgs; [
		# Coding
		nerd-fonts.fira-code
		jetbrains.idea-ultimate
		jetbrains.webstorm
		jetbrains.clion
		ghostty
		tmux
		
		# Gaming
		heroic-unwrapped
		prismlauncher
		greenfoot
		mangohud
		gamemode
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
		firefox
	];
	
	home.stateVersion = "24.05";
}
