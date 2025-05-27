{ username, ... }:
{
  home-manager.users.${username}.programs.qutebrowser = {
    enable = true;
  };
}
