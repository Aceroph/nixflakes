{ lib, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "~/Pictures/rigby.jpg";
      };
      display = {
        color.keys = "yellow";
        separator = " ";
      };
      modules = [
        {
          type = "custom";
          key = "╭─────╮";
        }
        {
          type = "os";
          key = "│ OS  │";
          format = "{pretty-name}";
        }
        {
          type = "uptime";
          key = "│ UP  │";
        }
        {
          type = "packages";
          key = "│ PKG │";
        }
        {
          type = "shell";
          key = "│ SH  │";
        }
        {
          type = "wm";
          key = "│ WM  │";
        }
        {
          type = "cpu";
          key = "│ CPU │";
        }
        {
          type = "gpu";
          key = "│ GPU │";
        }
        {
          type = "memory";
          key = "│ MEM │";
        }
        {
          type = "disk";
          key = "│ DSK │";
        }
        {
          type = "custom";
          key = "╰─────╯";
        }
        {
          type = "custom";
          key = "       ";
          format = lib.concatStrings (
            builtins.map (x: builtins.fromJSON ''"\u001b[${toString x}m "'') [
              30
              31
              32
              33
              34
              35
              36
              37
            ]
          );
        }
      ];
    };
  };
}
