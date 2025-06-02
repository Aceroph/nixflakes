{ username, ... }:

{
  home-manager.users.${username}.programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 34;
        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "cpu"
          "memory"
          "backlight"
          "pulseaudio"
          "battery"
          "sway/language"
          "privacy"
          "network"
          "tray"
        ];
        "sway/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            default = "";
            urgent = "";
            focused = "";
          };
        };
        "clock" = {
          format = "{:%A, %B %d   %H:%M}";
          tooltip = false;
        };
        "cpu" = {
          format = "{usage}% <span color='#9e9'></span> ";
        };
        "memory" = {
          format = "{used} GiB <span color='#e9e'></span> ";
        };
        "backlight" = {
          format = "{percent}% <span color='#ee9'>{icon}</span> ";
          tooltip = false;
          format-muted = "{percent}%  ";
          format-icons = [
            "󰛩"
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];
        };
        "pulseaudio" = {
          format = "{volume}% <span color='#e99'>{icon}</span> ";
          format-icons = {
            headphone = "";
            speaker = "󰓃";
            hdmi = "󰡁";
            headset = "";
            car = "";
            phone = "";
          };
        };
        "battery" = {
          format = "{capacity}% <span color='#9ee'>{icon}</span> ";
          tooltip-format = "{timeTo}";
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "sway/language" = {
          format = "{}";
        };
        "privacy" = { };
        "network" = {
          format = "{icon} ";
          tooltip-format = "{essid} on {ifname}";
          format-icons = {
            wifi = "";
            ethernet = "󰈀";
            disconnected = "󰖪";
          };
        };
        "tray" = { };
      };
    };
    style = builtins.readFile ./style.css;
  };
}
