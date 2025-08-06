{ pkgs, username, ... }:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.greetd.greetd}/bin/agreety --cmd ${pkgs.xorg.xinit}/bin/startx";
      user = "${username}";
    };
  };
}
