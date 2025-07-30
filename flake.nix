{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      home-manager,
      nixos-hardware,
      nixpkgs,
      quickshell,
      ...
    }:
    {
      nixosConfigurations = {
        nixos =
          let
            system = "x86_64-linux";
            quickshell-patched = quickshell.packages.${system}.default.overrideAttrs (oa: {
              patches = (oa.patches or [ ]) ++ [ ./config/quickshell/cursor-movement-event.patch ];
            });
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "acero";
              hostname = "asus";
              colors = import ./colors.nix { inherit nixpkgs; };
              inherit system quickshell-patched;
            } // inputs;
            modules = [
              ./.
            ];
          };
      };
    };
}
