julia:

{ buildInputs ? [], name, src, ... } @ attrs:

let self = julia.stdenv.mkDerivation (

  {
    doCheck = false;
    # doInstallCheck = true;

  installPhase = ''
    mkdir -p $out
    cp -R ${src}/* $out
    '';

  }
  //
  attrs
  //
  {
    name = "julia-" + name;
    buildInputs = buildInputs ++ [ julia ];
  }
);

in

julia.stdenv.mkDerivation (
  attrs // {
  name = self.name;
 
  installPhase = ''
    mkdir -p $out
    cp -R ${src}/* $out
    '';

  JULIA_LOAD_PATH = "${self}/src";
  }
)
