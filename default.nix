{ home-manager, ... }:

{
  imports = [
    home-manager.nixosModule.home-manager
    ./modules
    ./hosts
    ./users
  ];
}
