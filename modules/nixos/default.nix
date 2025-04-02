{ desktop, ... }:

{
  imports = [
    ./${desktop}
    ./bluetooth
    ./nvidia
  ];
}
