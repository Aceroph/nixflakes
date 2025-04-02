{
  environment.pathsToLink = [ "/libexec" ];

  services = {
    xserver = {
      windowManager.i3.enable = true;
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
    };
    displayManager = {
      defaultSession = "xfce+i3";
    };
  };
}
