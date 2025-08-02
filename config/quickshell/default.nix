{ quickshell, ... }:

{
  home.packages = [
    quickshell
  ];
  home.file.".config/quickshell" = {
    source = ./src;
    recursive = true;
  };
}
