{ colors, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      colors = {
        alpha = 0.75;
        foreground = colors.text;
        background = colors.background;
        regular0 = colors.background;
        regular1 = colors.danger;
        regular2 = colors.success;
        regular3 = colors.primary;
        regular4 = colors.secondary;
        regular5 = colors.tertiary;
        regular6 = colors.warning;
        regular7 = colors.text;
        bright0 = colors.background-darker;
        bright1 = colors.danger-muted;
        bright2 = colors.success-muted;
        bright3 = colors.primary-muted;
        bright4 = colors.secondary-muted;
        bright5 = colors.tertiary-muted;
        bright6 = colors.warning-muted;
        bright7 = colors.text-muted;
      };
      main = {
        font = "D2CodingLigature Nerd Font:size=12";
        pad = "10x10";
      };
    };
  };
}
