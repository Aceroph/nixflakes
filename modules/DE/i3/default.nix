{
  username,
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.pathsToLink = [ "/libexec" ];

  services = {
    pipewire.enable = false;
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    xserver = {
      # Xfce dm
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      # i3 wm
      windowManager.i3.enable = true;

    };
    displayManager = {
      defaultSession = "xfce+i3";
    };
  };

  home-manager.users.${username} = {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        defaultWorkspace = "workspace number 1";
        startup = [
          {
            command = "blueman-applet";
            always = true;
          }
        ];
        keybindings =
          let
            modifier = config.home-manager.users.${username}.xsession.windowManager.i3.config.modifier;
          in
          lib.mkOptionDefault {
            "${modifier}+q" = "kill";
            "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
            "${modifier}+Shift+e" = "exec xfce4-session-logout";

          };
        bars = [
          {
            position = "bottom";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          }
        ];
        modifier = "Mod4";
        gaps = {
          inner = 10;
          outer = 5;
        };
      };
    };

    programs.i3status-rust = {
      enable = true;
      bars = {
        bottom = {
          blocks = [
            {
              block = "time";
              interval = 60;
              format = " $timestamp.datetime(f:'%a %d/%m %k:%M %p') ";
            }
          ];
          icons = "awesome5";
          theme = "gruvbox-dark";
        };
      };
    };
  };
}
