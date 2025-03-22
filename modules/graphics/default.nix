{ config, ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Nvidia
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:1:0";
      nvidiaBusId = "PCI:0:0:2";
    };
  };

  services = {
    xserver.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
  };
}
