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
        gnome =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "acero";
              hostname = "asus";
              desktop = "gnome";
              bar = null;
              inherit system;
            } // inputs;
            modules = [
              ./.
            ];
          };

        nixos =
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
              ./modules/bluetooth
              ./modules/neovim
            ];
          };

        sway =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "acero";
              hostname = "asus";
              desktop = "sway";
              bar = "waybar";
              inherit system;
            } // inputs;
            modules = [
              ./.
              ./modules/qutebrowser
              ./modules/alacritty
              ./modules/bluetooth
              ./modules/neovim
              ./modules/nvidia
              ./modules/greetd
              ./modules/obs
            ];
          };
      };
    };
}
