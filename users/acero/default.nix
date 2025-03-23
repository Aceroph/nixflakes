{
  username,
  pkgs,
  ...
}:

{
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [ "wheel" ];
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
      greenfoot
      mangohud
      gamemode
      steam

      # Entertainement
      discord
      gimp
      spotify
      libreoffice-qt6-fresh

      # Peripherals
      libratbag
      easyeffects
      piper
      firefox
    ];

    home.stateVersion = "25.05";
  };
}
