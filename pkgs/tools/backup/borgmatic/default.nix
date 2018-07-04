{ stdenv, pythonPackages, pkgs }:

with pkgs.lib;

pythonPackages.buildPythonApplication rec {
  pname = "borgmatic";
  version = "1.2.0";

  src = pythonPackages.fetchPypi {
    inherit pname version;
    sha256 = "3ce089f32e3f521659e6a4a9b53e8218c7a84bd4f43c2498fbb42f08bc166ba5";
  };

  ruamel_yaml = pythonPackages.buildPythonPackage rec {
    name = "ruamel.yaml-${version}";
    version = "0.15.0";

    src = pkgs.fetchurl {
      url = "mirror://pypi/r/ruamel.yaml/${name}.tar.gz";
      sha256 = "f9f4a50422acf4a6ab55b568ae879b3ceb62e8e62a60022cb88816c17e40782e";
    };

    # Tests cannot load the module to test
    doCheck = false;

    propagatedBuildInputs = with pythonPackages; [ ruamel_base typing ] ++
    (optional (!isPy3k) pythonPackages.ruamel_ordereddict);

    meta = with stdenv.lib; {
      description = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order";
      homepage = https://bitbucket.org/ruamel/yaml;
      license = licenses.mit;
    };
  };

  pykwalify = pythonPackages.buildPythonPackage rec {
    pname = "pykwalify";
    version = "1.6.1";

    src = pythonPackages.fetchPypi {
      inherit pname version;
      sha256 = "191fd3f457f23c0aa8538c3a5c0249f70eeb1046e88d0eaaef928e09c44dff8d";
    };

    doCheck = false;

    propagatedBuildInputs = with pythonPackages; [
      pyyaml
      docopt
      python-dateutil
    ];
  };

  buildInputs = with pythonPackages; [ setuptools_scm ];

  propagatedBuildInputs = [
    pykwalify ruamel_yaml
  ];

  meta = with stdenv.lib; {
    homepage = https://torsion.org/borgmatic;
    description = "A simple Python wrapper for the Borg backup software.";
    license = licenses.gpl3;
  };
}
