{
  username,
  pkgs,
  config,
  lib,
  ...
}:

{
  home-manager.users.${username} = {
    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      checkConfig = false;
      config = {
        defaultWorkspace = "workspace number 1";
        bars = [
          { command = "waybar"; }
        ];
        keybinds =
          let
            modifier = config.wayland.windowManager.sway.config.modifier;
          in
          lib.mkOptionDefault {
            "${modifier}+q" = "kill";
          };
        extraConfig = "corner_radius 15";
      };
    };
  };
}
