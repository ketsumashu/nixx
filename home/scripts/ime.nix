{ pkgs, ... }:
let
  imes = pkgs.writeShellScriptBin "imes" ''

    yaskkserv2 --google-suggest /home/mashu/nixx/home/libskk/jisyo.yaskkserv2
    sleep 2; fcitx5 -rd
  '';
in
{
  home.packages = [ imes ];
}
