{
  username,
  config,
  pkgs,
  lib,
  ...
}:

{
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
}
