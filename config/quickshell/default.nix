{ quickshell, pkgs, ... }:

let
  package = quickshell.packages.${pkgs.system}.default;
in
{
  home.packages = [
    package
  ];
  home.file.".config/quickshell" = {
    source = ./src;
    recursive = true;
  };
}
