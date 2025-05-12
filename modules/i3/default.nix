{
  username,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.${username} = {
    xsession.windowManager.i3 =
      let
        modifier = "Mod4";
      in
      {
        enable = true;
        package = pkgs.i3-gaps;
        config = {
          bars = [ ];
          defaultWorkspace = "workspace number 1";
          startup = [
            {
              command = "blueman-applet";
              always = true;
            }
          ];
          keybindings = lib.mkOptionDefault {
            "${modifier}+q" = "kill";
            "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
            "${modifier}+Shift+e" = "exec xfce4-session-logout";

          };
          modifier = modifier;
          gaps = {
            inner = 10;
            outer = 5;
          };
        };
      };
  };

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
