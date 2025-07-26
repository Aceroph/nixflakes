{ nixpkgs, ... }:

let
  colorscheme = {
    primary = "ffff66";
    primary-muted = "99993d";
    secondary = "66b3ff";
    secondary-muted = "3d6b99";
    tertiary = "b366ff";
    tertiary-muted = "6b3d99";
    danger = "ff6666";
    danger-muted = "993d3d";
    warning = "ffb366";
    warning-muted = "996b3d";
    success = "b3ff66";
    success-muted = "6b993d";
    background = "262626";
    background-lighter = "333333";
    background-darker = "191919";
    text = "f8f8d3";
    text-muted = "91917c";
  };
in
{
}
// colorscheme
