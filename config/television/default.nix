{ pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableBashIntegration = true;
  };

  home.packages = with pkgs; [ nix-search-tv ];

  home.file.".config/television/nix_channels.toml" =
    let
      tv-config = (pkgs.formats.toml { }).generate "nix_channels.toml" {
        cable_channel = [
          {
            name = "nixpkgs";
            source_command = "nix-search-tv print";
            preview_command = "nix-search-tv preview {}";
          }
        ];
      };
    in
    {
      source = "${tv-config}";
    };
}
