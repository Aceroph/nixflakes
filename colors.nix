{ nixpkgs, ... }:

let
  colorscheme = {
    theme = "gruvbox";
    background = "282828";
    red = "cc241d";
    green = "98971a";
    yellow = "d79921";
    blue = "458588";
    purple = "b16286";
    aqua = "689d6a";
    foreground = "a89984";
    bright-background = "928374";
    bright-red = "fb4934";
    bright-green = "b8bb26";
    bright-yellow = "fabd2f";
    bright-blue = "83a598";
    bright-purple = "d3869b";
    bright-aqua = "8ec07c";
    bright-foreground = "ebdbb2";
  };
  prefixed = removeAttrs (builtins.mapAttrs (name: value: "#" + value) colorscheme) [ "theme" ];
in
{
  inherit prefixed;
}
// colorscheme
