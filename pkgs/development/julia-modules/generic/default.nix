julia:

{ buildInputs ? [], name, src, ... } @ attrs:

let out = julia.stdenv.mkDerivation (

  {
    doCheck = false;
    # doInstallCheck = true;

  installPhase = ''
    mkdir -p $out
    cp -R ${src}/* $out
    '';

  # postFixup = ''
  #   if test -e $out/nix-support/propagated-native-build-inputs; then
  #       ln -s $out/nix-support/propagated-native-build-inputs $out/nix-support/propagated-user-env-packages
  #   fi
  # '';

  }
  //
  attrs
  //
  {
    name = "julia-" + name;
    builder = ./builder.sh;
    buildInputs = buildInputs ++ [ julia ];
  }
);

in

julia.stdenv.mkDerivation (
  attrs // {
  name = out.name;
  # JULIA_LOAD_PATH = "addToSearchPath JULIA_LOAD_PATH ${out}/src";
  JULIA_LOAD_PATH = "${out}/src";
  buildInputs = out.buildInputs;
  }
)
