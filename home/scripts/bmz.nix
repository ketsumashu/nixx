{ pkgs, ... }:

let
  bmz-launch = pkgs.writeShellScriptBin "bmz-launch" ''
    noctalia msg caffeine-enable

    cleanup() {
      noctalia msg caffeine-disable
    }

    trap cleanup EXIT INT TERM

    flatpak run net.hyrorre.BMZPlayer
  '';
in
{
  home.packages = [
    bmz-launch
  ];

  xdg.desktopEntries."net.hyrorre.BMZPlayer" = {
    name = "BMZ Player";
    comment = "BMS player for LunaticRave2 and beatoraja style charts";
    icon = "net.hyrorre.BMZPlayer";

    exec = "${bmz-launch}/bin/bmz-launch";

    categories = [ "Game" ];
    terminal = false;
    startupNotify = false;

  };
}
