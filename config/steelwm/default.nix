{ steelwm, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;
    display = 0;
    displayManager.startx.enable = true;
    desktopManager.xterm.enable = true;
    windowManager.dwm = {
      enable = true;
      package = steelwm.packages.x86_64-linux.default;
    };
  };
}
