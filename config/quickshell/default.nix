{ quickshell, pkgs, ... }:

let
  package = quickshell.packages.${pkgs.system}.default;
in
{
  home.packages = with pkgs; [
    package
    libcava
  ];
  home.file.".config/quickshell" = {
    source = ./src;
    recursive = true;
  };
}
