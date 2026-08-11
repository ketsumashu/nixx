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

  xdg.dataFile."applications/net.hyrorre.BMZPlayer.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=BMZ Player
    Comment=BMS player for LunaticRave2 and beatoraja style charts
    Icon=net.hyrorre.BMZPlayer
    Exec=${bmz-launch}/bin/bmz-launch
    Categories=Game;
    Terminal=false
    StartupNotify=false
  '';
}
