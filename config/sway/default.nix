{
  quickshell,
  colors,
  pkgs,
  lib,
  ...
}:

{
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
        terminal = "foot";
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
        window.border = 2;
        window.titlebar = false;
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
        colors =
          let
            common = {
              background = "#" + colors.background;
              indicator = "#" + colors.primary;
              text = "#" + colors.text;
              border = "#00000000";
            };
          in
          {
            focused = {
              childBorder = "#" + colors.primary;
            } // common;
            unfocused = {
              childBorder = "#" + colors.primary-muted;
            } // common;
            focusedInactive = {
              childBorder = "#" + colors.primary-muted;
            } // common;
            urgent = {
              childBorder = "#" + colors.danger;
            } // common;
            background = "#" + colors.background;
          };
        startup = [
          {
            always = true;
            command = "${quickshell.packages.x86_64-linux.default}/bin/quickshell";
          }
        ];
        inherit modifier terminal;
      };
    extraConfig = "corner_radius 10";
  };
}
