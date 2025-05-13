{ nixos-hardware, ... }:

{
  imports = [
    nixos-hardware.nixosModules.asus-fx504gd
    ./hardware-configuration.nix
  ];

  services = {
    logind.lidSwitch = "hibernate";
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Boot splash screen
  boot = {
    plymouth.enable = true;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
    ];
  };
}
