{ desktop, ... }:

{
  imports = [
    ./${desktop}
    ./bluetooth
    ./nvidia
  ];

  # Splash screen
  boot.plymouth.enable = true;
}
