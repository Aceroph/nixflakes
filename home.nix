{
  pkgs,
  ...
}:

{
  imports = [
    ./config/fastfetch
    ./config/flameshot
    ./config/ghostty
    ./config/spotify-player
    ./config/television
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
      extraConfig = {
        push = {
          autoSetupRemote = true;
        };
      };
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
      package = pkgs.jdk24;
    };
  };

  ############
  # Packages #
  ############
  home.packages = with pkgs; [
    android-studio
    blockbench
    cava
    (callPackage ./packages/eiffel-studio.nix { })
    fd
    firefox
    gimp
    graphviz-nox
    heroic
    jetbrains.idea-community
    libreoffice-qt6-fresh
    libratbag
    libsixel
    mangohud
    nerd-fonts.d2coding
    piper
    posting # Postman but TUI
    postgresql_16
    prismlauncher
    quickshell
    rainfrog # TUI for SQL
    spotify
    supabase-cli
    tmux
    wl-clicker
    xorg.xinit
  ];

  ##############
  # Quickshell #
  ##############
  xdg.configFile."quickshell" = {
    source = ./config/quickshell;
    recursive = true;
  };

  ############
  # Services #
  ############
  services = {
    blueman-applet.enable = true;
    easyeffects.enable = true;
    spotifyd = {
      enable = true;
      settings.global = {
        device_name = "nixos";
        device_type = "computer";
      };
    };
  };

  #########
  # Shell #
  #########
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      git_prompt(){
        branch=$(git branch --show-current 2>/dev/null)
        if [[ -n "$branch" ]]; then
            echo -ne "on \e[31;1m$branch "
            git diff --quiet
            if [[ "$?" -eq 1 ]]; then
                echo -e "\e[31;1m✗\e[0m "
            else
                echo -e "\e[32;1m✓\e[0m "
            fi
        else
            echo ""
        fi
      }
        
      PS1='\[\e[33;1m\]\w\[\e[0m\] '
      PS1+='$(git_prompt)'

      eval "$(zoxide init bash)"
    '';
    sessionVariables = {
      ISE_EIFFEL = pkgs.callPackage ./packages/eiffel-studio.nix { };
      ISE_PLATFORM = "linux-x86-64";
    };
    shellAliases = {
      cd = "z";
      nixos-rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos";
    };
  };

  home.stateVersion = "25.05";
}
