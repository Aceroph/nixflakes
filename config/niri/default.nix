{
  config,
  colors,
  ...
}:
{
  programs.niri.settings = {
    input = {
      keyboard = {
        xkb = {
          layout = "us,ca";
          variant = ",multix";
          options = "grp:alt_shift_toggle";
        };
        numlock = true;
      };
      touchpad.disabled-on-external-mouse = true;
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "0%";
      };
    };
    outputs = {
      "eDP-1".mode = {
        width = 1920;
        height = 1080;
        refresh = 60.;
      };
      "HDMI-A-1".position = {
        x = 1920;
        y = 0;
      };
    };
    layout = {
      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
      ];
      default-column-width.proportion = 1. / 2.;
      focus-ring = {
        width = 4;
        active.color = colors.prefixed.foreground;
        inactive.color = colors.prefixed.background;
        urgent.color = colors.prefixed.red;
      };
    };
    prefer-no-csd = true;
    screenshot-path = null;
    window-rules = [
      {
        matches = [
          {
            app-id = "^Ec$";
            title = "Preferences";
          }
          {
            app-id = "^Ec$";
            title = "Preferences|ec";
          }
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
      {
        geometry-corner-radius = rec {
          top-left = 12.;
          top-right = top-left;
          bottom-left = top-left;
          bottom-right = top-left;
        };
        clip-to-geometry = true;
      }
    ];
    binds = with config.lib.niri.actions; {
      # Misc
      "Mod+Shift+Slash".action = show-hotkey-overlay;
      "Mod+Return".action = spawn "foot";
      "Mod+D".action = spawn-sh "vicinae toggle";
      "Mod+L".action = spawn-sh "qs --config niri ipc call session-lock toggle";
      "Mod+O" = {
        action = toggle-overview;
        repeat = false;
      };
      "Mod+Q" = {
        action = close-window;
        repeat = false;
      };
      # Screenshotting
      "Print".action.screenshot = [ ];
      "Shift+Print".action.screenshot-screen = [ ];
      "Mod+Print".action.screenshot-window = [ ];
      # Function keys & other exotic things
      "XF86AudioRaiseVolume" = {
        action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
        allow-when-locked = true;
      };
      "XF86AudioLowerVolume" = {
        action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        allow-when-locked = true;
      };
      "XF86AudioMute" = {
        action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        allow-when-locked = true;
      };
      "XF86AudioMicMute" = {
        action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        allow-when-locked = true;
      };
      "XF86AudioPlay" = {
        action = spawn-sh "playerctl play-pause";
        allow-when-locked = true;
      };
      "XF86AudioStop" = {
        action = spawn-sh "playerctl stop";
        allow-when-locked = true;
      };
      "XF86AudioPrev" = {
        action = spawn-sh "playerctl previous";
        allow-when-locked = true;
      };
      "XF86AudioNext" = {
        action = spawn-sh "playerctl next";
        allow-when-locked = true;
      };
      "XF86MonBrightnessUp" = {
        action = spawn "brightnessctl" "--class=backlight" "set" "+10%";
        allow-when-locked = true;
      };
      "XF86MonBrightnessDown" = {
        action = spawn "brightnessctl" "--class=backlight" "set" "-10%";
        allow-when-locked = true;
      };
      # Focus columns/windows
      "Mod+Left".action = focus-column-left;
      "Mod+Down".action = focus-window-or-workspace-down;
      "Mod+Up".action = focus-window-or-workspace-up;
      "Mod+Right".action = focus-column-right;
      # Move columns/windows
      "Mod+Ctrl+Left".action = move-column-left;
      "Mod+Ctrl+Down".action = move-window-down-or-to-workspace-down;
      "Mod+Ctrl+Up".action = move-window-up-or-to-workspace-up;
      "Mod+Ctrl+Right".action = move-column-right;
      # Focus monitors
      "Mod+Shift+Left".action = focus-monitor-left;
      "Mod+Shift+Down".action = focus-monitor-down;
      "Mod+Shift+Up".action = focus-monitor-up;
      "Mod+Shift+Right".action = focus-monitor-right;
      # Scroll vertically through workspaces
      "Mod+WheelScrollDown" = {
        action = focus-workspace-down;
        cooldown-ms = 150;
      };
      "Mod+WheelScrollUp" = {
        action = focus-workspace-up;
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollDown" = {
        action = move-column-to-workspace-down;
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollUp" = {
        action = move-column-to-workspace-up;
        cooldown-ms = 150;
      };
      # Scroll horizontally through windows
      "Mod+Shift+WheelScrollDown".action = focus-column-right;
      "Mod+Shift+WheelScrollUp".action = focus-column-left;
      "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
      "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;
      # Focus workspaces
      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;
      # Move windows to workspaces
      "Mod+Ctrl+1".action = move-column-to-index 3;
      "Mod+Ctrl+2".action = move-column-to-index 2;
      "Mod+Ctrl+3".action = move-column-to-index 3;
      "Mod+Ctrl+4".action = move-column-to-index 4;
      "Mod+Ctrl+5".action = move-column-to-index 5;
      "Mod+Ctrl+6".action = move-column-to-index 6;
      "Mod+Ctrl+7".action = move-column-to-index 7;
      "Mod+Ctrl+8".action = move-column-to-index 8;
      "Mod+Ctrl+9".action = move-column-to-index 9;
      # Window dimensions
      "Mod+R".action = switch-preset-column-width;
      "Mod+Shift+R".action = switch-preset-window-height;
      "Mod+Ctrl+R".action = reset-window-height;
      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+Minus".action = set-window-width "-10%";
      "Mod+Equal".action = set-window-width "+10%";
      "Mod+Shift+Minus".action = set-window-height "-10%";
      "Mod+Shift+Equal".action = set-window-width "+10%";
      # Layout
      "Mod+V".action = toggle-window-floating;
      "Mod+W".action = toggle-column-tabbed-display;
      # Exit
      "Mod+Escape" = {
        allow-inhibiting = false;
        action = toggle-keyboard-shortcuts-inhibit;
      };
      "Mod+Shift+E".action = quit;
      "Ctrl+Alt+Delete".action = quit;
      "Mod+Shift+P".action = power-off-monitors;
    };
  };
}
