{ username, pkgs, ... }:

{
  home-manager.users.${username} = {
    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      checkConfig = false;
      config = {
        modifier = "Mod4";
        terminal = "alacritty";
      };
    };
  };
}
