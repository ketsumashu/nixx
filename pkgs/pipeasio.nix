{
  stdenv,
  lib,
  fetchFromGitHub,
  cmake,
  ninja,
  pkg-config,
  pipewire,
  wineWow64Packages,
  makeWrapper,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "pipeasio-int24";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "M0n7y5";
    repo = "pipeasio";
    tag = "v${finalAttrs.version}";
    hash = "sha256-fWIRYe5BBgSdUfdRBdLwDM9t/3KCRO/IfFsomy9cDZs=";
  };

  patches = [
    ./pipeasio-int24.patch
  ];

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
    wineWow64Packages.stable
    makeWrapper
  ];

  buildInputs = [ pipewire ];

  cmakeFlags = [
    "-DBUILD_SETTINGS_PANEL=OFF"
    "-DBUILD_TESTS=OFF"
  ];

  postInstall = ''
    wrapProgram $out/bin/pipeasio-register \
      --set PIPEASIO_PREFIX "$out"
  '';

  meta = {
    description = "Int24 ASIO to PipeWire driver for Wine and Proton";
    homepage = "https://github.com/M0n7y5/pipeasio";
    changelog = "https://github.com/M0n7y5/pipeasio/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
})
