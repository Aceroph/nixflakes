{ username, ... }:

{
  home-manager.users.${username}.services.polybar = {
    enable = true;
    script = ''
      		polybar-msg cmd quit
      		polybar bar 2>&1 | tee -a /temp/polybar.log & disown
      		'';
    config = {
      "bar/top" = {
        width = "100%";
        height = "30px";
        modules-center = "date";
      };
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%d.%m.%y";
        time = "%H:%M";
        label = "%time%  %date%";
      };
    };
  };
}
