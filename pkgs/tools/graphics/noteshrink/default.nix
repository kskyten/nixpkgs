{ stdenv
, fetchFromGitHub
, pythonPackages
, imagemagick
, optipng
}:

pythonPackages.buildPythonPackage rec {
  pname = "noteshrink";
  version = "0.1.1";
  name = "${pname}-${version}";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "mzucker";
    repo = pname;
    rev = "${version}";
    sha256 = "0xhrvg3d8ffnbbizsrfppcd2y98znvkgxjdmvbvin458m2rwccka";
  };

  propagatedBuildInputs = with pythonPackages; [
    numpy
    scipy
    pillow
  ] ++ [
  imagemagick
  optipng];

  meta = with stdenv.lib; {
    description = "Convert scans of handwritten notes to beautiful, compact PDFs.";
    homepage = https://github.com/mzucker/noteshrink;
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
