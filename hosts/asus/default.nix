{ nixos-hardware, ... }:

{
  imports = [
    nixos-hardware.nixosModules.asus-fx504gd
    ./hardware-configuration.nix
  ];

  services.logind.extraConfig = ''
    		HandlePowerKey=suspend
  '';
}
