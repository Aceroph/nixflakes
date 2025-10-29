{ colors, ... }:

{
  services.vicinae = {
    enable = true;
    autoStart = true;
    themes.custom-dark = {
      version = 1;
      name = "Custom theme";
      description = "A custom theme generated from colors.nix";
      variant = "dark";
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
      theme.name = "custom-dark";
      window = {
        csd = false;
        opacity = 0.8;
        rounding = 10;
      };
    };
  };
}
