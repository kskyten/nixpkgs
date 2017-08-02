julia:

{ buildInputs ? [], name, src, ... } @ attrs:

julia.stdenv.mkDerivation (

  {
    doCheck = false;
    doInstallCheck = false;

    installCheck = ''
      julia $out/test/runtests.jl
      '';

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
    JULIA_LOAD_PATH = "$out/src";
  }
)
