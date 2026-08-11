{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "infinitas-launch" ''
      noctalia msg caffeine-enable

      cleanup(){
        noctalia msg caffeine-disable
      }

      trap cleanup EXIT INT TERM

      /home/mashu/.local/bin/konamate infinitas run --notify "$@"
    '')
  ];
}
