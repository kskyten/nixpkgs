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

  HPAT = buildJuliaPackage rec {
    name = "HPAT";
    src = fetchFromGitHub {
      owner = "IntelLabs";
      repo = "HPAT.jl";
      rev = "ad6275b99c39ed6f3f63996d38fc8269ecf98372";
      sha256 = "0pbgm9h6f0q19xvvj82jn8bkd8643r9jd39wcr1pzz9p0p3igpdg";
    };

    # not really a dependency
    buildInputs = [ MLKernels ];
  };

}; in self
