{
  lib,
  stdenv,
  fetchurl,
  openjdk,
  glib,
  dpkg,
  wrapGAppsHook3,
}:

stdenv.mkDerivation rec {
  pname = "greenfoot";
  version = "3.7.1";

  src = fetchurl {
    url = "https://www.greenfoot.org/download/files/Greenfoot-linux-${
      builtins.replaceStrings [ "." ] [ "" ] version
    }.deb";
    hash = "sha256-wGgKDsA/2luw+Nzs9dWb/HRHMx/0S0CFfoI53OCzxug=";
  };

  nativeBuildInputs = [
    dpkg
    wrapGAppsHook3
  ];
  buildInputs = [ glib ];

  dontWrapGApps = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r usr/* $out

    makeWrapper ${openjdk}/bin/java $out/bin/greenfoot \
      "''${gappsWrapperArgs[@]}" \
      --add-flags "-Dawt.useSystemAAFontSettings=on -Xmx512M \
                   -cp $out/share/greenfoot/boot.jar bluej.Boot \
                   -greenfoot=true -bluej.compiler.showunchecked=false \
                   -greenfoot.scenarios=$out/share/doc/Greenfoot/scenarios \
                   -greenfoot.url.javadoc=file://$out/share/doc/Greenfoot/API"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Simple integrated development environment for Java - JDK included";
    homepage = "https://www.greenfoot.org/";
    sourceProvenance = with sourceTypes; [ binaryBytecode ];
    license = licenses.gpl2ClasspathPlus;
    mainProgram = "greenfoot";
    maintainers = [ "Aceroph" ];
    platforms = platforms.linux;
  };
}
