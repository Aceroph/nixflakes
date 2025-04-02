{
  username,
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.pathsToLink = [ "/libexec" ];

  services = {
    xserver = {
      enable = true;
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
    };
    displayManager = {
      defaultSession = "xfce+i3";
    };
  };

  home-manager.users.${username} = {
    # Remove i3status
    programs.i3status = {
      enable = false;
      package = null;
    };
    xsession.windowManager.i3 = {
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
        keybindings =
          let
            modifier = config.home-manager.users.${username}.xsession.windowManager.i3.config.modifier;
          in
          lib.mkOptionDefault {
            "${modifier}+q" = "kill";
            "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
            "${modifier}+Shift+e" = "exec xfce4-session-logout";

          };
        modifier = "Mod4";
        gaps = {
          inner = 10;
          outer = 5;
        };
      };
    };
  };
}
