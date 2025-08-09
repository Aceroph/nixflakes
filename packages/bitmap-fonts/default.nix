{
  lib,
  pkgs,
  stdenv,
  fontname ? "bitocra",
}:

stdenv.mkDerivation {
  pname = "bitmap-${fontname}";
  version = "1.0";
  src = pkgs.fetchFromGitHub {
    owner = "Tecate";
    repo = "bitmap-fonts";
    rev = "5c101c91bf2ed0039aad02f9bf76ddb2018b1f21";
    sha256 = "sha256-1FUNybNCD1OVSgAMYkgyyGQmjmRWTu6YhjD7YelPIWg=";
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/bitmap
    cp -r $src/bitmap/${fontname} $out/share/fonts/bitmap/

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/Tecate/bitmap-fonts";
    description = "Monospaced bitmap fonts for X11, good for terminal use.";
    platforms = platforms.linux;
  };
}
