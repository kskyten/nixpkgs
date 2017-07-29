{pkgs, overrides}:

let self = _self // overrides; _self = with self; {

  inherit (pkgs) buildJuliaPackage fetchurl fetchFromGitHub stdenv julia fetchsvn;
  inherit (stdenv.lib) maintainers;

  MLKernels = buildJuliaPackage rec {
    name = "MLKernels";
    src = fetchFromGitHub {
      owner = "trthatcher";
      repo = "MLKernels.jl";
      rev = "v0.2.0";
      sha256 = "01kc47d3q9dk63hqag9sa83fdh24hj12x4zv94vdhas7sp2fqzfw";
    };
  };

}; in self
