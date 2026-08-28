{ pkgs, lib, ... }:

let
  infinitas-launch = pkgs.writeShellScriptBin "infinitas-launch" ''
    noctalia msg caffeine-enable

    cleanup() {
      noctalia msg caffeine-disable
    }

    trap cleanup EXIT INT TERM

    /home/mashu/.local/bin/konamate run infinitas --notify "$@"
  '';
in
{
  home.packages = [
    infinitas-launch
  ];

  xdg.desktopEntries.infinitas = {
    name = "beatmania IIDX INFINITAS";
    comment = "Play beatmania IIDX INFINITAS on Konaste";
    icon = "infinitas";

    exec = "${infinitas-launch}/bin/infinitas-launch %u";

    categories = [ "Game" ];
    terminal = false;
    startupNotify = true;

    mimeType = [
      "x-scheme-handler/bm2dxinf"
    ];
  };

  home.activation.infinitasMime = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.xdg-utils}/bin/xdg-mime default \
      infinitas.desktop \
      x-scheme-handler/bm2dxinf
  '';
}
