{
  programs.quickshell = {
    enable = true;
    activeConfig = "niri";
    configs = {
      niri = ./niri;
    };
    systemd.enable = true;
  };
}
