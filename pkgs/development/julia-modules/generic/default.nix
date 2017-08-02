julia:

{ buildInputs ? [], name, src, ... } @ attrs:

julia.stdenv.mkDerivation (
  {
    doCheck = false;
    # doInstallCheck = true;

  # JULIA_LOAD_PATH =
  # ''$JULIA_LOAD_PATH${JULIA_LOAD_PATH:+:}$out/julia-packages/${name}'';

  installPhase = ''
    mkdir -p $out/julia-packages/${name}
    cp -R ${src}/* $out/julia-packages/${name}
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
    builder = ./builder.sh;
    buildInputs = buildInputs ++ [ julia ];
  }
)
