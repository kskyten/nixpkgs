{ stdenv, python3Packages }:

with python3Packages;

buildPythonApplication rec {
  name = "${pname}-${version}";
  pname = "todoman";
  version = "3.4.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "dc01585fda6ee492ee41b6db676c365f9c118af6fcda9e97ce517c9e9b0b8424";
  };

  buildInputs = [ setuptools_scm ];
  checkInputs = [ pytest ];

  propagatedBuildInputs = [
    atomicwrites
    click
    click-log
    configobj
    humanize
    icalendar
    parsedatetime
    dateutil
    pyxdg
    tabulate
    urwid
  ];

  doCheck = false;

}
