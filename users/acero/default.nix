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

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "Aceroph";
      userEmail = "aos92@proton.me";
    };

    programs.lsd = {
      enable = true;
      settings = {
        layout = "tree";
        recursion = {
          enabled = true;
          depth = 5;
        };
      };
    };

    programs.java = {
      enable = true;
      package = pkgs.jetbrains.jdk;
    };

    services.easyeffects.enable = true;

    home.packages = with pkgs; [
      # Coding
      nerd-fonts.fira-code
      jetbrains.idea-ultimate
      jetbrains.webstorm
      jetbrains.clion
      ghostty
      tmux

      # Gaming
      heroic-unwrapped
      prismlauncher
      (callPackage ../../packages/greenfoot-3.7.1.nix { })
      mangohud

      # Entertainement
      discord
      gimp
      spotify
      libreoffice-qt6-fresh

      # Peripherals
      libratbag
      piper
      firefox
    ];

    home.stateVersion = "25.05";
  };
}
