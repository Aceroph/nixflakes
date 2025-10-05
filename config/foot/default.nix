{ colors, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Sono:size=12";
        pad = "5x5 center";
      };
      bell.system = false;
      colors = {
        regular0 = colors.background;
        regular1 = colors.red;
        regular2 = colors.green;
        regular3 = colors.yellow;
        regular4 = colors.blue;
        regular5 = colors.purple;
        regular6 = colors.aqua;
        regular7 = colors.foreground;
        bright0 = colors.bright-background;
        bright1 = colors.bright-red;
        bright2 = colors.bright-green;
        bright3 = colors.bright-yellow;
        bright4 = colors.bright-blue;
        bright5 = colors.bright-purple;
        bright6 = colors.bright-aqua;
        bright7 = colors.bright-foreground;
        alpha = 0.8;
      };
    };
  };
}
