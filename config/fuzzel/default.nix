{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "foot -a '{cmd}' -T '{cmd}' {cmd}";
      };
    };
  };
}
