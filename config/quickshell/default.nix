{ quickshell, ... }:

{
  home.packages = [
    quickshell
  ];
  xdg.configFile."quickshell" = {
    source = ./src;
    recursive = true;
  };
}
