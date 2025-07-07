{
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
        colors = {
          focused = {
            background = colors.background;
            border = colors.primary;
            childBorder = colors.primary;
            indicator = colors.primary;
            text = colors.text;
          };
          unfocused = {
            background = colors.background;
            border = colors.primary-muted;
            childBorder = colors.primary-muted;
            indicator = colors.primary-muted;
            text = colors.text;
          };
          background = colors.background;
        };
        inherit modifier terminal;
      };
    extraConfig = "corner_radius 10";
  };
}
