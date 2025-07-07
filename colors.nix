{ nixpkgs, ... }:

let
  colors = {
    primary = "#ffff66";
    primary-muted = "#666629";
    danger = "#ff6666";
    warning = "#ffa666";
    success = "#99ff66";
    background = "#262626";
    background-lighter = "#333333";
    background-darker = "#191919";
    text = "f8f8d3";
  };

  inherit (nixpkgs.lib.strings) removePrefix;
in
{
  /**
      Removes the hashtag in front of hex color codes.

      # Inputs

      `color`
      : The hex color code to strip.

      # Type

      ```
      removeHash :: string -> string
      ```

      # Examples
      :::{.example}
      ## `colors.removeHash` usage example

      ```nix
      rremoveHash "#FFFFFF"
      => "FFFFFF".
      ```

      :::
  */
  removeHash = color: removePrefix "#" color;
}
// colors
