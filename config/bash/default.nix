{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = builtins.readFile ./.bashrc;
    sessionVariables = {
      ISE_EIFFEL = pkgs.callPackage ../../packages/eiffel-studio.nix { };
      ISE_PLATFORM = "linux-x86-64";
    };
    shellAliases = {
      cd = "z";
      nixos-rebuild = "sudo nixos-rebuild switch --flake ~/.config/nixos";
    };
  };
}
