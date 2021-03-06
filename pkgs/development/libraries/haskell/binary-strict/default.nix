# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, mtl }:

cabal.mkDerivation (self: {
  pname = "binary-strict";
  version = "0.4.8.1";
  sha256 = "07mmh4x8qjpw7w35nxcq8wayy4bagjblbwkpvh3xd38rxpdnl6pi";
  buildDepends = [ mtl ];
  meta = {
    homepage = "http://code.haskell.org/binary-low-level";
    description = "Binary deserialisation using strict ByteStrings";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
