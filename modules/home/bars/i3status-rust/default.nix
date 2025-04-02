{ pkgs, ... }:

{
  xsession.windowManager.i3.config.bars = [
    {
      position = "bottom";
      statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
      fonts = {
        names = [ "GohuFont Nerd Font Mono" ];
        style = "Regular";
        size = 12.0;
      };
    }
  ];
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
          {
            block = "keyboard_layout";
          }
        ];
        icons = "material-nf";
        theme = "gruvbox-dark";
      };
    };
  };
}
