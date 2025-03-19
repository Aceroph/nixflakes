{ config, pkgs, ... }:

{
	imports = [ ./modules/neovim.nix ];

	programs.git = {
		enable = true;
		userName = "Aceroph";
		userEmail = "aos92@proton.me";
	};
	
	home.stateVersion = "24.05";
}
