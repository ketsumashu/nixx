{ pkgs, ... }:
let
  scr = pkgs.writeShellScriptBin "scr" ''

    wezterm start --class "Floaterm"  -e nvim -c 'startinsert' -c 'set binary noeol' /tmp/scr || exit 1
    if [[ -e /tmp/scr ]]; then
        cat /tmp/scr | wl-copy
        rm -f /tmp/scr
    fi
  '';
in
{
  home.packages = [ scr ];
}
