{ pkgs, ... }:

{
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    seahorse
    cheese
    geary
    gedit
  ];

  services = {
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
