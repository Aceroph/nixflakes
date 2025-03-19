{ config, pkgs, ... }:

{
	imports = [ ./modules/neovim.nix ];
	
	home.stateVersion = "24.05";
}
