{ quickshell, pkgs, ... }:

let
  package = quickshell.packages.${pkgs.system}.default;
in
{
  home.packages = [ package ];
  home.file.".config/quickshell" = {
    source = ./src;
    recursive = true;
  };

  systemd.user.services.quickshell = {
    Unit = {
      Description = "My quickshell widgets";
      After = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart = "${package}/bin/quickshell";
      Restart = "on-failure";
      RestartSec = "3";
    };
  };
}
