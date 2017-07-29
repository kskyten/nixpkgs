julia:

{ buildInputs ? [], name, src, ... } @ attrs:

julia.stdenv.mkDerivation (
  {
    doCheck = false;
    # doInstallCheck = true;

  JULIA_LOAD_PATH = "$JULIA_LOAD_PATH:$out";

  installPhase = ''
    mkdir -p $out
    cp -R ${src}/* $out
    '';

  postFixup = ''
    if test -e $out/nix-support/propagated-native-build-inputs; then
        ln -s $out/nix-support/propagated-native-build-inputs $out/nix-support/propagated-user-env-packages
    fi
  '';

  }
  //
  attrs
  //
  {
    name = "julia-" + name;
    # builder = ./builder.sh;
    buildInputs = buildInputs ++ [ julia ];
  }
)
