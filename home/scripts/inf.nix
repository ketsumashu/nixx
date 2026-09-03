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

  infinitas-asio-launch = pkgs.writeShellScriptBin "infinitas-asio-launch" ''
    cleanup() {
      noctalia msg caffeine-disable
    }

    trap cleanup EXIT INT TERM

    noctalia msg caffeine-enable

    WINEDLLPATH=/home/mashu/.local/lib/wine''${WINEDLLPATH:+:$WINEDLLPATH} \
      /home/mashu/.local/bin/konamate run infinitas --profile gamescope --notify "$@"
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

    /home/mashu/.local/bin/konamate profile registry apply infinitas common
  '';
in
{
  home.packages = [
    infinitas-launch
    infinitas-asio-launch
    infinitas-pipeasio-register
  ];

  home.file.".local/lib/wine".source = "${pkgs.pipeasio}/lib/wine";

  home.file.".config/pipeasio/config.ini".text = ''
    [pipeasio]
    output_device =
    buffer_size = 64
    fixed_buffer_size = true
    sample_rate = 44100
    node_name = INFINITAS-pipeasio
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

  xdg.desktopEntries.infinitas-asio = {
    name = "beatmania IIDX INFINITAS (ASIO)";
    comment = "Play beatmania IIDX INFINITAS through PipeASIO";
    icon = "infinitas";

    exec = "${infinitas-asio-launch}/bin/infinitas-asio-launch %u";

    categories = [ "Game" ];
    terminal = false;
    startupNotify = true;
  };

  home.activation.infinitasMime = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.xdg-utils}/bin/xdg-mime default \
      infinitas.desktop \
      x-scheme-handler/bm2dxinf
  '';
}
