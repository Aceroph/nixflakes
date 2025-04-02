{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      ...
    }:
    {
      nixosConfigurations = {
        nixos =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "acero";
              hostname = "asus";
              desktop = "gnome";
              inherit system;
            } // inputs;
            modules = [
              ./.
            ];
          };

        i3 =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "acero";
              hostname = "asus";
              desktop = "i3";
              bar = "polybar";
              inherit system;
            } // inputs;
            modules = [
              ./.
            ];
          };
      };
    };
}
