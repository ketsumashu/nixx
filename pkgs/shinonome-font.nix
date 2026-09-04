{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gawk,
  gnumake,
  perl,
  bdftopcf,
  mkfontscale,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "shinonome-font";
  version = "0.9.11";

  src = fetchFromGitHub {
    owner = "code4fukui";
    repo = "shinonome-font";
    rev = "053b21e0a11ef5799c1ea3cefc374763add80617";
    hash = "sha256-taagUIgbsltkxsZ71UPkguwjhLk/gmTi6X520KbT+hQ=";
  };

  nativeBuildInputs = [
    gawk
    gnumake
    perl
    bdftopcf
    mkfontscale
  ];

  configurePhase = ''
    runHook preConfigure
    ./configure \
      --prefix="$out" \
      --with-fontdir="$out/share/fonts/misc" \
      --with-family=Shinonome \
      --disable-bold \
      --disable-italic \
      --disable-bolditalic \
      --disable-mincho \
      --disable-marumoji \
      --disable-progressbar
    runHook postConfigure
  '';

  buildPhase = ''
    runHook preBuild
    make -C 16/kanjic shnmk16.bdf
    perl -MEncode -ne '
      if (/^(ENCODING|DEFAULT_CHAR) ([0-9]+)$/) {
        $code = $2;
        if ($code >= 0x2121 && $code <= 0x7e7e) {
          $bytes = pack("CC", ($code >> 8) + 0x80, ($code & 0xff) + 0x80);
          print "$1 ", ord(decode("euc-jp", $bytes)), "\n";
          next;
        }
      }
      s/JISX0208\.1990-0/ISO10646-1/;
      s/JISX0208\.1983/ISO10646/;
      s/CHARSET_ENCODING "0"/CHARSET_ENCODING "1"/;
      print;
    ' 16/kanjic/shnmk16.bdf > shnmk16-unicode.bdf
    bdftopcf shnmk16-unicode.bdf | gzip -9c > shnmk16.pcf.gz
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm444 shnmk16.pcf.gz "$out/share/fonts/misc/shnmk16.pcf.gz"
    mkfontdir "$out/share/fonts/misc"
    runHook postInstall
  '';

  meta = {
    description = "Shinonome 16-dot Japanese bitmap Gothic font";
    homepage = "https://github.com/code4fukui/shinonome-font";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
})
