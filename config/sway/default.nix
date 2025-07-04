{
  username,
  pkgs,
  lib,
  ...
}:

{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      wl-clipboard
      slurp # Screenshot utility
      grim # Screenshot utility
    ];

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
            inner = 10;
            outer = 8;
          };
          input = {
            "*" = {
              xkb_layout = "us,ca";
              xkb_variant = ",multix";
              xkb_options = "grp:alt_shift_toggle";
            };
          };
          window.border = 0;
          defaultWorkspace = "workspace number 1";
          bars = [
            {
              command = "waybar";
            }
          ];
          keybindings = lib.mkOptionDefault {
            "${modifier}+q" = "kill";
            "Print" = "exec grim -g \"$(slurp)\" -  | wl-copy";
            "Shift+Print" = "exec grim - | wl-copy";
          };
          colors = {
            focused = {
              background = "#282828";
              border = "#363636";
              childBorder = "#282828";
              indicator = "#282828";
              text = "#f0f0f0";
            };
          };
          inherit modifier terminal;
        };
      extraConfig = "corner_radius 10";
    };
  };
}
