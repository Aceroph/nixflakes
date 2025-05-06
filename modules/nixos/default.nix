{ desktop, ... }:

{
  imports = [
    ./${desktop}
    ./bluetooth
    ./nvidia
  ];

  # Splash screen
  programs.plymouth.enable = true;
}
