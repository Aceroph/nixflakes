{ home-manager, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
    ./modules
    ./hosts
    ./users
  ];
}
