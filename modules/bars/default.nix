{ bar, ... }:

{
  imports = if bar != null then [ ./${bar}.nix ] else [ ];
}
