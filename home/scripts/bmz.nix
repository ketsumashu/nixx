{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "bmz-launch" ''
      noctalia msg caffeine-enable

      cleanup(){
        noctalia msg caffeine-disable
      }

      trap cleanup EXIT INT TERM

      flatpak run net.hyrorre.BMZPlayer
    '')
  ];
}
