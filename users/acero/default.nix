{
  username,
  pkgs,
  ...
}:

{
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [
      "wheel"
      "audio"
    ];
  };

  programs.dconf.enable = true;

  programs.gamemode.enable = true;

  # STEAM
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
