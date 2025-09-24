{ inputs, ... }:

{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      theme = "${inputs.grub-theme.packages.x86_64-linux.default}/grub/themes/grub-theme";
    };
  };
}
