{
  programs.fuzzel = {
    enable = false;
    settings = {
      main = {
        terminal = "foot -a '{cmd}' -T '{cmd}' {cmd}";
      };
    };
  };
}
