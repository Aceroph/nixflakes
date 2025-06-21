{ username, ... }:

{
  home-manager.users.${username}.programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "D2CodingLigature Nerd Font Mono";
          style = "Regular";
        };
      };
      window = {
        padding.x = 5;
        opacity = 0.9;
        blur = true;
      };
    };
  };
}
