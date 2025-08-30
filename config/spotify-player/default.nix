{ colors, ... }:

{
  programs.spotify-player = {
    enable = true;
    settings = {
      client_id = "2d818b8a55bd4d00b03deffadb6b7b6c";
      theme = colors.theme;
    };
  };
}
