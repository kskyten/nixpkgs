{ stdenv, fetchFromGitHub, cudatoolkit, gcc, cmakeCurses, python2, fftwSinglePrec, doxygen }:

stdenv.mkDerivation rec {
  name = "openmm-${version}";
  version = "7.1.1";

  src = fetchFromGitHub {
    owner = "pandegroup";
    repo = "openmm";
    rev = "${version}";
    sha256 = "1fdimwp0i7jbbw707mkhz87xigki12d2slba1dq1sl985yn1ykkp";
    };

    buildInputs = [ cudatoolkit gcc cmakeCurses python2 doxygen fftwSinglePrec ];

    meta = {
    description = "OpenMM is a toolkit for molecular simulation using high performance GPU code.";
    homepage = https://github.com/pandegroup/openmm;

    license = stdenv.lib.licenses.bsd3;
    # maintainers = [ stdenv.lib.maintainers. ];
    # platforms = stdenv.lib.platforms.all;
    };
}
