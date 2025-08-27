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

  ##########
  # Direnv #
  ##########
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };

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
      package = (pkgs.jdk23.override { enableJavaFX = true; });
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
    jetbrains.idea-ultimate
    libreoffice-qt6-fresh
    libratbag
    libsixel
    mangohud
    nerd-fonts.d2coding
    piper
    posting # Postman but TUI
    postgresql_16
    prismlauncher
    qemu-user
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
      direnv_prompt(){
        if [[ -n "$DIRENV_DIR" ]]; then
            echo -e "\e[34m(env)\e[0m "
        else
            echo ""
        fi
      }

      git_prompt(){
        branch=$(git branch --show-current 2>/dev/null)
        if [[ -n "$branch" ]]; then
            echo -ne "on \e[31;1m$branch\e[0m"
            if [[ -d "$PWD/.git/refs/remotes/" ]]; then
                up=$(git log origin/$branch..$branch --oneline | wc -l)
                down=$(git log $branch..origin/$branch --oneline | wc -l)
                if [[ "$up" -gt 0 ]]; then
                    echo -ne " \e[32;1m+$up\e[0m"
                fi
                if [[ "$down" -gt 0 ]]; then
                    echo -ne " \e[31;1m-$down\e[0m"
                fi
            fi
            untracked=$(git diff --numstat)
            staged=$(git diff --cached --numstat)
            if [[ -n "$untracked" ]]; then
                echo -ne " \e[36;1mU\e[0m"
            fi
            if [[ -n "$staged" ]]; then
                echo -e " \e[32;1mS\e[0m "
            else
                echo -e " "
            fi
        else
            echo ""
        fi
      }

      PS1='$(direnv_prompt)'
      PS1+='\[\e[33;1m\]\w\[\e[0m\] '
      PS1+='$(git_prompt)'

      eval "$(zoxide init bash)"
      eval "$(direnv hook bash)"
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
