{stdenv}: stdenv.mkDerivation  {
  name = "quickcheck4c";
  src = ./.;
  installPhase = ''make DESTDIR=$out install'';
}
