{ quickshell-patched, ... }:

{
  home.packages = [
    quickshell-patched
  ];
  home.file.".config/quickshell" = {
    source = ./src;
    recursive = true;
  };
}
