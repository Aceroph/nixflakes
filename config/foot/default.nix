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
        bright0 = colors.primary0;
        bright1 = colors.primary1;
        bright2 = colors.primary2;
        bright3 = colors.primary3;
        bright4 = colors.primary4;
        bright5 = colors.primary5;
        bright6 = colors.primary6;
      };
      main = {
        font = "D2CodingLigature Nerd Font:size=12";
        pad = "10x10";
      };
    };
  };
}
