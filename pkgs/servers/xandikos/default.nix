{ stdenv, python3Packages }:

with python3Packages;

buildPythonApplication rec {
  name = "${pname}-${version}";
  pname = "xandikos";
  version = "0.0.9";

  src = fetchPypi {
    inherit pname version;
    sha256 = "6eaf641292f04aef81117fef89daa6e963fd8d9506da082dde0dfcb006557519";
  };

  propagatedBuildInputs = [
    dulwich
    defusedxml
    icalendar
    jinja2
  ];

  doCheck = false;

}
