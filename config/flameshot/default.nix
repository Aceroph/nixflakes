{ colors, ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        uiColor = "#" + colors.background;
        drawColor = "#" + colors.primary;
      };
    };
  };
}
