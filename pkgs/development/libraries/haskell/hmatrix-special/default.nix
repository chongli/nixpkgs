# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, gsl, hmatrix, hmatrixGsl }:

cabal.mkDerivation (self: {
  pname = "hmatrix-special";
  version = "0.3.0.1";
  sha256 = "1ziqzbfrk7xyah5n0cys1ccnmj2z91wxdamanv3y5v717zhdrqix";
  buildDepends = [ hmatrix hmatrixGsl ];
  extraLibraries = [ gsl ];
  meta = {
    homepage = "https://github.com/albertoruiz/hmatrix";
    description = "Interface to GSL special functions";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
  };
})
