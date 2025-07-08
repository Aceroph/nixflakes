{ colors, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      colors = {
        alpha = 0.75;
        foreground = colors.text;
        background = colors.background;
        regular0 = colors.primary;
        regular1 = colors.danger;
        regular2 = colors.success;
        regular3 = colors.warning;
        regular4 = colors.secondary;
        regular5 = colors.text;
        regular6 = colors.text-muted;
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
