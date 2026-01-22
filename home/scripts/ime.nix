{ pkgs, ... }:
let
  imes = pkgs.writeShellScriptBin "imes" ''

    yaskkserv2 --google-suggest ~/nixx/home/libskk/jisyo.yaskkserv2
    fcitx5 -rd
  '';
in
{
  home.packages = [ imes ];
}
