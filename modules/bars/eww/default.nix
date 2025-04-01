{ username, ... }:

{
  home-manager.users.${username}.programs.eww = {
    enable = true;
    configDir = ./config;
  };
}
