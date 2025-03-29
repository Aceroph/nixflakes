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
  };
}
