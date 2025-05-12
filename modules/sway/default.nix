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
              fonts = {
                names = [ "GohuFont 14 Nerd Font Mono" ];
                style = "Regular";
                size = 14.0;
              };
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
