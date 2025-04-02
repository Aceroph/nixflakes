{
  lib,
  pkgs,
  ...
}:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
    };
    script = ''
      		polybar-msg cmd quit
      		polybar top 2>&1 | ${lib.getExe' pkgs.coreutils "tee"} -a /tmp/polybar.log & disown
      		'';
    config = {
      "bar/top" = {
        width = "100%";
        height = "30px";
        modules-left = "i3";
        modules-right = "date tray";
      };
      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = true;
        show-urgent = true;
        index-sort = true;
        enable-scroll = false;
      };
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%d.%m.%y";
        time = "%H:%M";
        label = "%time%  %date%";
      };
      "module/tray" = {
        type = "internal/tray";
      };
    };
  };
}
