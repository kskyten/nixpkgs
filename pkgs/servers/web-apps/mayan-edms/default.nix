{ pkgs, stdenv, fetchFromGitLab, nginx, redis,
  postgresql, unpaper, tesseract, poppler, libpng, python2, zlib }:
# { stdenv, fetchFromGitLab, nginx, supervisor, redis, postgresql, unpaper, tesseract, poppler, libpng }:

stdenv.mkDerivation rec {
  version = "2.6.4";
  name = "mayan-edms-${version}";

  src = fetchFromGitLab {
    owner = "mayan-edms";
    repo = "mayan-edms";
    # rev = "456000992719a353b8fd56965518389b4e307f98";
    rev = "v${version}";
    sha256 = "1myndmwhc7y0r54aicyi697j8j3rrq67h2jqvncd0m7wrm6ibsmj";
    };

    # pydeps = with pkgs.python27Packages; [ supervisor psycopg2 redis ipython django ];
    pydeps = with pkgs.python27Packages; [ pip ipython virtualenv
                                           pillow python_magic ];
    buildInputs = [ nginx redis postgresql unpaper tesseract
                    poppler libpng python2 zlib ] ++ pydeps;

    meta = {
    description = "Free Open Source DMS (document management system)";
    homepage = https://www.mayan-edms.com/;
    # license = stdenv.lib.licenses.;
    # maintainers = [ stdenv.lib.maintainers. ];
    # platforms = stdenv.lib.platforms.;
    };
}
