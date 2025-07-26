{ nixpkgs, ... }:

let
  colorscheme = {
    primary = "ffff66";
    primary-muted = "666629";
    secondary = "66b3ff";
    tertiary = "b366ff";
    danger = "ff6666";
    warning = "ffb366";
    success = "b3ff66";
    background = "262626";
    background-lighter = "333333";
    background-darker = "191919";
    text = "f8f8d3";
    text-muted = "787866";
    primary0 = "ffff1a";
    primary1 = "ffff33";
    primary2 = "ffff4d";
    primary3 = "ffff66";
    primary4 = "ffff80";
    primary5 = "ffff99";
    primary6 = "ffffb3";
  };
in
{
}
// colorscheme
