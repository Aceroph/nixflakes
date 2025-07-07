{ colors, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      colors = {
        foreground = colors.removeHash colors.text;
        background = colors.removeHash colors.background + "bf"; # 0.75 opacity
        regular0 = colors.removeHash colors.primary;
      };
      main = {
        font = "D2CodingLigature Nerd Font:size=14";
        pad = "10x10";
      };
    };
  };
}
