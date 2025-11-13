{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:Aceroph/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    grub-theme = {
      url = "github:Aceroph/grub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae = {
      url = "github:Aceroph/vicinae";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      home-manager,
      nixpkgs,
      ...
    }:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem rec {
          specialArgs = {
            hostname = "asus";
            colors = import ./colors.nix { inherit (nixpkgs) lib; };
            username = "acero";
            system = "x86_64-linux";
            inherit
              inputs
              ;
          };
          modules = [
            ./.
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit inputs;
              }
              // specialArgs;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${specialArgs.username}" = ./home.nix;
            }
          ];
        };
      };
    };
}
