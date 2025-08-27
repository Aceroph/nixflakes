{
  lib,
  pkgs,
  stdenv,
  ...
}:

let
  ver = "19.05";
  build = "103187";
  system = "linux-x86-64";
in
stdenv.mkDerivation {
  pname = "eiffelstudio";
  version = ver;
  src = fetchTarball {
    url = "https://sourceforge.net/projects/eiffelstudio/files/EiffelStudio%20${ver}/Build_${build}/Eiffel_${ver}_gpl_${build}-${system}.tar.bz2/download";
    sha256 = "sha256:1m96qg581m1hfjaycc0i0v96vlhs7y0nl9slxk0qb24x3ki2xpjf";
  };

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    gtk2-x11
    xorg.libXtst
  ];

  buildInputs = with pkgs; [
    gnumake
  ];

  installPhase = ''
    runHook preInstall

      mkdir -p $out
      cp -r . $out
      ln -s $out/studio/spec/${system}/bin $out

      runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://www.eiffel.com/eiffelstudio/";
    description = "IDE for one programming language, Eiffel.";
    license = licenses.gpl2;
    platforms = platforms.linux;
    mainProgram = "estudio";
  };
}
