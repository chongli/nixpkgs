{ stdenv, fetchurl, autoconf, automake, libtool, pkgconfig, gtk, libpng, exiv2
, lcms, intltool, gettext, libchamplain, fbida
}:

stdenv.mkDerivation rec {
  name = "geeqie-${version}";
  version = "1.2";

  src = fetchurl {
    url = mirror://debian/pool/main/g/geeqie/geeqie_1.2.orig.tar.gz;
    sha256 = "0wkcpyh3f6ig36x1q6h9iqgq225w37visip48m72j8rpghmv1rn3";
  };

  configureFlags = [ "--enable-gps" ];

  preConfigure = "./autogen.sh";

  buildInputs = [
    autoconf automake libtool pkgconfig gtk libpng exiv2 lcms intltool gettext
    #libchamplain
  ];

  postInstall = ''
    # Allow geeqie to find exiv2 and exiftran, necessary to
    # losslessly rotate JPEG images.
    sed -i $out/lib/geeqie/geeqie-rotate \
        -e '1 a export PATH=${exiv2}/bin:${fbida}/bin:$PATH'
  '';

  meta = with stdenv.lib; {
    description = "Lightweight GTK+ based image viewer";

    longDescription =
      ''
        Geeqie is a lightweight GTK+ based image viewer for Unix like
        operating systems.  It features: EXIF, IPTC and XMP metadata
        browsing and editing interoperability; easy integration with other
        software; geeqie works on files and directories, there is no need to
        import images; fast preview for many raw image formats; tools for
        image comparison, sorting and managing photo collection.  Geeqie was
        initially based on GQview.
      '';

    license = licenses.gpl2Plus;

    homepage = http://geeqie.sourceforge.net;

    maintainers = with maintainers; [ pSub ];
    platforms = platforms.gnu;
  };
}
