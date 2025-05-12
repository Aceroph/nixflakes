{ username, ... }:

{
  home-manager.users.${username}.programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "GohuFont 11 Nerd Font Mono";
          style = "Regular";
        };
      };
    };
  };
}
