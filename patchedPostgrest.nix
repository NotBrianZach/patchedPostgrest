# patchelf --set-interpreter \
#    ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/bin/postgrest
# patchelf --set-rpath "/nix/store/caz03y58cyrqn4i5ckdw4i21g9sdjb18-zlib-1.2.8/lib, /nix/store/23vndix3mzcyw84kag06h8fh464g32nq-glibc-2.24/lib, /nix/store/5rz84iskq9yljx4ab2d0w4iz0x3wjkk1-postgresql-9.5.4-lib/lib, /nix/store/z2c4i7zdf1qds7l5s2a78zwxncqdfgqf-gmp-6.1.1/lib" $out/bin/postgrest
with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "patched-postgrest";

  src = fetchurl {
    url = http://bitbucket.org/NotBrianZach/dockercollectivestorybook/downloads/patchedPostgrest.tar.xz; # http://static.jonof.id.au/dl/kenutils/pngout-20130221-linux.tar.gz
    sha256 = "cc8992a1983a5716e0b4f091665e7c27811bc07a3bb6160c5766467f95bed8fd";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp postgrest $out/bin
  '';
  # installPhase = ''
  #   mkdir -p $out/bin
  #   cp x86_64/pngout $out/bin
  #   patchelf --set-interpreter \
  #       ${stdenv.glibc}/lib/ld-linux-x86-64.so.2 $out/bin/pngout
  #   patchelf --set-rpath ${stdenv.glibc}/lib $out/bin/pngout
  # '';
}
