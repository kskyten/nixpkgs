{ stdenv, fetchzip, perl }:

stdenv.mkDerivation rec {
  version = "1.20170129";
  pkgname = "myrepos";
  name = "${pkgname}-${version}";

  src = fetchzip {
    url = "https://git.joeyh.name/index.cgi/myrepos.git/snapshot/${pkgname}-${version}.tar.gz";
    sha256 = "15i9bs2i25l7ibv530ghy8280kklcgm5kr6j86s7iwcqqckd0czp";
    };

    buildInputs = [ perl ];

    DESTDIR = "$(out)";
    PREFIX = "";

    checkTarget = "test";

    meta = {
    description = "Multiple Repository management tool";
    homepage = http://myrepos.branchable.com;
    license = stdenv.lib.licenses.gpl2;
    # maintainers = [ stdenv.lib.maintainers. ];
    # platforms = stdenv.lib.platforms.;
    };
}
