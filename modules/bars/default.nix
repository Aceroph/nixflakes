{ bar, ... }:

{
  imports = if bar != null then [ ./${bar} ] else [ ];
}
