{ bar, ... }:

{
  imports = if bar then [ ./${bar} ] else [ ];
}
