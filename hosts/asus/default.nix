{
  nixos-hardware,
  pkgs,
  ...
}:

{
  imports = [
    nixos-hardware.nixosModules.asus-fx504gd
    ./hardware-configuration.nix
  ];

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Boot splash screen
  boot = {
    plymouth = {
      enable = true;
      theme = "minecraft_world_loading";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
        minecraft-plymouth-theme
      ];
    };

    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };
}
