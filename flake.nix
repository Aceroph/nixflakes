{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
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
              DE = "gnome";
              inherit system;
            } // inputs;
            modules = [
              ./.
            ];
          };

        nixos-i3 =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "acero";
              host = "asus";
              DE = "i3";
              inherit system;
            } // inputs;
            modules = [
              ./.
            ];
          };
      };
    };
}
