{ bar, ... }:

{
  imports =
    if isNull bar then
      [ ]
    else
      [
        ./${bar}
      ];
}
