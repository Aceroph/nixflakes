{
  home-manager,
  username,
  pkgs,
  ...
}:

{
  environment.pathsToLink = [ "/libexec" ];

  services = {
    xserver = {
      # Xfce dm
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      # i3 wm
      windowManager.i3.enable = true;

      displayManager = {
        defaultSession = "xfce";
        sddm.enable = true;
      };
    };
  };

  home-manager.users.${username}.xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };
}
