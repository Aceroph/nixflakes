{
  quickshell,
  colors,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    wl-clipboard
    slurp # Screenshot utility
    grim # Screenshot utility
  ];

  wayland.windowManager.sway =
    let
      swayfx-unwrapped-patched = pkgs.swayfx-unwrapped.overrideAttrs (oa: {
        patches = oa.patches ++ [ ./get_mouse_ipc_command.patch ];
      });
    in
    {
      enable = true;
      package = pkgs.swayfx.override {
        swayfx-unwrapped = swayfx-unwrapped-patched;
      };
      checkConfig = false;
      config =
        let
          modifier = "Mod4";
          terminal = "foot";
        in
        {
          gaps = {
            inner = 10;
            outer = 8;
          };
          input = {
            "*" = {
              xkb_layout = "us,ca";
              xkb_variant = ",multix";
              xkb_options = "grp:alt_shift_toggle";
            };
          };
          window.border = 2;
          defaultWorkspace = "workspace number 1";
          bars = [
            {
              command = "waybar";
            }
          ];
          keybindings = lib.mkOptionDefault {
            "${modifier}+q" = "kill";
            "Print" = "exec grim -g \"$(slurp)\" -  | wl-copy";
            "Shift+Print" = "exec grim - | wl-copy";
            "XF86AudioMute" = "exec qs ipc call volume toggleMute";
            "XF86AudioLowerVolume" = "exec qs ipc call volume decrease 0.05";
            "XF86AudioRaiseVolume" = "exec qs ipc call volume increase 0.05";
            "button3" = "exec qs ipc call context open";
          };
          colors = {
            focused = rec {
              border = "#" + colors.primary;
              childBorder = border;
              background = border;
              indicator = border;
              text = "#" + colors.background;
            };
            unfocused = rec {
              border = "#" + colors.background;
              childBorder = border;
              background = border;
              indicator = border;
              text = "#" + colors.text;
            };
            focusedInactive = rec {
              border = "#" + colors.background;
              childBorder = border;
              background = border;
              indicator = border;
              text = "#" + colors.text;
            };
            urgent = rec {
              border = "#" + colors.danger;
              childBorder = border;
              background = border;
              indicator = border;
              text = "#" + colors.danger-muted;
            };
            background = "#" + colors.background;
          };
          startup =
            let
              quickshell-bin = "${quickshell}/bin/quickshell";
            in
            [
              {
                always = true;
                command = "pkill ${quickshell-bin} && ${quickshell-bin}";
              }
            ];
          inherit modifier terminal;
        };
    };
}
