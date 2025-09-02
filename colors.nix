{ lib }:

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

  hexMap = {
    "0" = 0;
    "1" = 1;
    "2" = 2;
    "3" = 3;
    "4" = 4;
    "5" = 5;
    "6" = 6;
    "7" = 7;
    "8" = 8;
    "9" = 9;
    "a" = 10;
    "b" = 11;
    "c" = 12;
    "d" = 13;
    "e" = 14;
    "f" = 15;
  };

  # Return the modulo of `a` & `b`.
  mod = a: b: a - (b * (a / b));

  # Return the division of `a` & `b`, rounded to the lowest integer.
  divFloor = a: b: builtins.floor (builtins.div a b);
in
rec {
  # Return the colors from the colorscheme but prefixed with #, except for the theme attribute.
  prefixed = removeAttrs (builtins.mapAttrs (name: value: "#" + value) colorscheme) [ "theme" ];

  # Return the decimal value of a singular hexadecimal digit.
  hex2dec = hex: hexMap.${lib.toLower (builtins.toString hex)};

  # Return the hexadecimal value of a singular decimal digit.
  dec2hex =
    dec: builtins.head (builtins.filter (name: hexMap.${name} == dec) (builtins.attrNames hexMap));

  # Returns a hexadecimal string representation of a RGB attrset.
  fromRGB =
    {
      r,
      g,
      b,
    }:
    dec2hex (divFloor r 15)
    + dec2hex (mod r 15)
    + dec2hex (divFloor g 15)
    + dec2hex (mod g 15)
    + dec2hex (divFloor b 15)
    + dec2hex (mod b 15);

  # Returns the RGB attrset from a hexadecimal string representation.
  toRGB = hex: {
    r = hex2dec (builtins.substring 0 1 hex) * hex2dec (builtins.substring 1 1 hex);
    g = hex2dec (builtins.substring 2 1 hex) * hex2dec (builtins.substring 3 1 hex);
    b = hex2dec (builtins.substring 4 1 hex) * hex2dec (builtins.substring 5 1 hex);
  };

  # Returns the sum of two RGB attrsets.
  addRGB =
    {
      r,
      g,
      b,
    }@x:
    {
      r,
      g,
      b,
    }@y:
    {
      r = x.r + y.r;
      g = x.g + y.g;
      b = x.b + y.b;
    };
}
// colorscheme
