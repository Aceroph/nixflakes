{
  stdenv,
}:

stdenv.mkDerivation {
  name = "nixos-plymouth";
  version = "1.0";

  src = ./.;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plymouth/themes/nixos
    cp -r $src/{*.plymouth,script,images} $out/share/plymouth/themes/nixos/
    substituteInPlace $out/share/plymouth/themes/nixos/*.plymouth --replace '@OUT@' "$out/share/plymouth/themes/nixos/"

    runHook postInstall
  '';
}
