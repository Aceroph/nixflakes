{ colors, ... }:

{
  services.dunst = {
    enable = false;
    settings = {
      global = {
        origin = "top-center";
        corner_radius = 5;
        background = colors.prefixed.background;
        foreground = colors.prefixed.foreground;
        frame_color = colors.prefixed.bright-green;
      };
      urgency_low = {
        frame_color = colors.prefixed.bright-yellow;
      };
      urgency_critical = {
        frame_color = colors.prefixed.bright-red;
      };
    };
  };
}
