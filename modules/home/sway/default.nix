{ pkgs, ... }:

{
  options.wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
  };
}
