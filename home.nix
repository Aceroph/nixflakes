{
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./config/fastfetch
    ./config/foot
    ./config/sway
    ./config/quickshell
    ./config/vesktop
  ];

  #######
  # Gtk #
  #######
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  ############
  # Programs #
  ############
  programs = {
    git = {
      enable = true;
      userName = "Aceroph";
      userEmail = "aos92@proton.me";
    };

    lsd = {
      enable = true;
      settings = {
        layout = "tree";
        recursion = {
          enabled = true;
          depth = 2;
        };
      };
    };

    java = {
      enable = true;
      package = pkgs.jetbrains.jdk;
    };
  };

  ############
  # Services #
  ############
  services = {
    easyeffects.enable = true;
    blueman-applet.enable = true;
  };

  ############
  # Packages #
  ############
  home.packages = with pkgs; [
    # Coding
    nerd-fonts.d2coding
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.clion
    graphviz-nox
    valgrind
    tmux
    gdb

    # Gaming
    wl-clicker
    heroic
    prismlauncher
    mangohud

    # Entertainement
    gimp
    spotify
    libreoffice-qt6-fresh
    firefox

    # Peripherals
    libratbag
    sixel
    piper
  ];

  #########
  # Shell #
  #########
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git*' check-for-changes true
      zstyle ':vcs_info:git*' formats 'on %F{red}%b%f%u%c '
      zstyle ':vcs_info:git*' stagedstr ' %F{green}S%f'
      zstyle ':vcs_info:git*' unstagedstr ' %F{yellow}U%f'
      precmd() {
          vcs_info
      }

      setopt prompt_subst
      PROMPT='%F{black}%~%f ''${vcs_info_msg_0_}'

      eval "$(zoxide init zsh)"
    '';
    shellAliases = {
      cd = "z";
      nixos-rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos";
    };
  };

  home.stateVersion = "25.05";
}
