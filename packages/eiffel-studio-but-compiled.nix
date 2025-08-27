{
  lib,
  pkgs,
  stdenv,
  ...
}:

stdenv.mkDerivation {
  pname = "eiffelstudio";
  version = "19.05";
  src =
    let
      repo = pkgs.fetchFromGitHub {
        repo = "EiffelStudio";
        owner = "EiffelSoftware";
        rev = "160c109468756e482daee87356c5a66e308e1afb";
        sha256 = "sha256-HDR7HrkUvHYn6XaxIdKyDehS16YrgkYiit+FVOEyh8w=";
      };
    in
    "${repo}/Src";

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    gtk2-x11
    xorg.libXtst
  ];

  buildInputs = with pkgs; [
    gcc
    gnumake
  ];

  ISE_PLATFORM = "linux-x86-64";

  buildPhase = ''
    runHook preBuild

    export EIFFEL_SRC=$PWD
    export ISE_LIBRARY=$PWD

    cd $EIFFEL_SRC/C
    sed -i 's/\/bin\/sed/sed/g' ./CONFIGS/$ISE_PLATFORM
    sed -i 's/\/bin\/rm/rm/g' ./CONFIGS/$ISE_PLATFORM
    ./quick_configure

    make clobber

    cd $EIFFEL_SRC/library/net/Clib
    finish_freezing -library
    cd $EIFFEL_SRC/library/vision2/Clib
    finish_freezing -library
    cd $EIFFEL_SRC/library/wel/Clib
    finish_freezing -library
    cd $EIFFEL_SRC/library/cURL/Clib
    finish_freezing -library
    cd $EIFFEL_SRC/library/web_browser/Clib
    finish_freezing -library

    cd $EIFFEL_SRC/C_library/zlib
    finish_freezing -library
    cd $EIFFEL_SRC/C_library/libpng
    finish_freezing -library

    cd $EIFFEL_SRC/framework/cli_writer/Clib
    finish_freezing -library
    cd $EIFFEL_SRC/framework/cli_debugger/Clib
    finish_freezing -library

    ec -config ec.ecf -target bench -c_compile

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

      mkdir -p $out
      cp -r . $out
      ln -s $out/studio/spec/linux-x86-64/bin $out

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
