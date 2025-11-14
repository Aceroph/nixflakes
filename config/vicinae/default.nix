{ colors, ... }:

{
  programs.vicinae = {
    enable = true;
    systemd.enable = true;
    themes.custom = {
      meta = {
        version = 1;
        name = "Custom theme";
        description = "A custom theme generated from colors.nix";
        variant = "dark";
      };
      colors.core = {
        background = colors.prefixed.background;
        foreground = colors.prefixed.foreground;
        red = colors.prefixed.red;
        yellow = colors.prefixed.yellow;
        green = colors.prefixed.green;
        cyan = colors.prefixed.aqua;
        blue = colors.prefixed.blue;
        purple = colors.prefixed.purple;
      };
    };
    settings = {
      faviconService = "twenty";
      font = {
        size = 11;
        family = "Sono";
      };
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      theme.name = "vicinae-custom-theme";
      window = {
        csd = false;
        opacity = 0.8;
        rounding = 10;
      };
    };
  };
}
