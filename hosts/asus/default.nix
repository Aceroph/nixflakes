{ nixos-hardware, ... }:

{
  imports = [
    nixos-hardware.nixosModules.asus-fx504gd
    ./hardware-configuration.nix
  ];
}
