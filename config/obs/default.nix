{
  pkgs,
  username,
  ...
}:
{
  home-manager.users.${username}.programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
    ];
  };
}
