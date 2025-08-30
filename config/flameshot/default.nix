{ colors, ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        uiColor = colors.prefixed.background;
        drawColor = colors.prefixed.yellow;
      };
    };
  };
}
