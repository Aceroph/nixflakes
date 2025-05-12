{
  username,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.${username} = {
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
          defaultWorkspace = "workspace number 1";
          bars = [
            {
              command = "waybar";
            }
          ];
          keybindings = lib.mkOptionDefault {
            "${modifier}+q" = "kill";
          };
          inherit modifier terminal;
        };
      extraConfig = "corner_radius 15";
    };
  };
}
