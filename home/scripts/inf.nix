{ pkgs, lib, ... }:

let
  infinitas-launch = pkgs.writeShellScriptBin "infinitas-launch" ''
    noctalia msg caffeine-enable

    cleanup() {
      noctalia msg caffeine-disable
    }

    trap cleanup EXIT INT TERM

    WINEDLLPATH=/home/mashu/.local/lib/wine''${WINEDLLPATH:+:$WINEDLLPATH} \
      /home/mashu/.local/bin/konamate run infinitas --notify "$@"
  '';

  infinitas-pipeasio-register = pkgs.writeShellScriptBin "infinitas-pipeasio-register" ''
    set -eu

    driver=/home/mashu/.local/lib/wine/x86_64-windows/pipeasio64.dll
    prefix=/home/mashu/game/konamate/infinitas

    if [ ! -f "$driver" ]; then
      echo "PipeASIO is not installed in ~/.local/lib/wine yet." >&2
      exit 1
    fi

    ${pkgs.coreutils}/bin/install -Dm644 "$driver" \
      "$prefix/drive_c/windows/system32/pipeasio64.dll"

    WINEDLLPATH=/home/mashu/.local/lib/wine''${WINEDLLPATH:+:$WINEDLLPATH} \
      /home/mashu/.local/bin/konamate exec infinitas \
        umu-run regsvr32 /s pipeasio64.dll
  '';
in
{
  home.packages = [
    infinitas-launch
    infinitas-pipeasio-register
  ];

  home.file.".local/lib/wine".source = "${pkgs.pipeasio}/lib/wine";

  home.file.".config/pipeasio/config.ini".text = ''
    [pipeasio]
    output_device = konaste-sink
  '';

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
