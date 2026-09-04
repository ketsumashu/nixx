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
    make -C 16/kanjic medium
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm444 16/kanjic/shnmk16.pcf.gz "$out/share/fonts/misc/shnmk16.pcf.gz"
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
