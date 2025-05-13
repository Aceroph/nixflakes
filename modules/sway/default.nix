{
  username,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.${username} = {
    services.swww.enable = true;

    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      checkConfig = false;
      config =
        let
          modifier = "Mod4";
          terminal = "alacritty";
        in
        {
          gaps = {
            inner = 7;
            outer = 12;
          };
          border = 0;
          defaultWorkspace = "workspace number 1";
          bars = [
            {
              command = "waybar";
            }
          ];
          keybindings = lib.mkOptionDefault {
            "${modifier}+q" = "kill";
          };
          colors = {
            focused = {
              background = "#ff0000";
              border = "#00ff00";
              childBorder = "#0000ff";
              indicator = "#ffff00";
              text = "#00ffff";
            };
          };
          inherit modifier terminal;
        };
      extraConfig = "corner_radius 15";
    };
  };
}
