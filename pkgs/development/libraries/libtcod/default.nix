{ fetchurl, stdenv, bash, ncurses, SDL
, mesa, x11, zlib
}:

stdenv.mkDerivation rec {
  name = "libtcod";
  version = "1.5.2";

  src = fetchurl {
    name = "libtcod-1.5.2.tar.gz";
    url = "http://doryen.eptalys.net/?file_id=46";
    sha256 = "4debfc0cb5fcdda7ed5d02f93d7fd50e9a4f4f8e3bd2525aa4f6242a84fb67cd";
  };

  oldVersion = fetchurl {
    name = "libtcod-1.5.1.tar.gz";
    url = "http://doryen.eptalys.net/?file_id=28";
    sha256 = "0dpjhbdwgh6vch0zs17gclkqkvrqf7qqdndzhxm4xgy19xqrrm3b";
  };

  buildInputs = [ ncurses SDL mesa x11 zlib ];

  buildPhase = ''
    tar -zxf $oldVersion libtcod-1.5.1/makefiles/makefile-linux64 -O > Makefile
    rm *.so
    make
  '';

  installPhase = ''
    mkdir -p $out/lib
    cp libtcod.so $out/lib/libtcod.so.1
    ln -s $out/lib/libtcod.so.1 $out/lib/libtcod.so
  '';

  meta = {
    description = "The libtcod roguelike library";
    homepage = http://doryen.eptalys.net/libtcod/;
    license = "BSD";
  };
}
