{ pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [ nix-search-tv ];

  home.file.".config/television/nix-channels.toml" =
    (pkgs.formats.toml { }).generate "nix-channels.toml"
      {
        cable_channel = [
          {
            name = "nixpkgs";
            source_command = "nix-search-tv print";
            preview_command = "nix-search-tv preview {}";
          }
        ];
      };
}
