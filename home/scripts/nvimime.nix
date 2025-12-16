{ pkgs, ... }:
let
  scr = pkgs.writeShellScriptBin "scr" ''

    foot --app-id Floaterm  -e nvim -c "\<Plug>(skkeleton-enable" -c 'startinsert' -c 'set binary noeol' /tmp/scr || exit 1
    if [[ -e /tmp/scr ]]; then
        cat /tmp/scr | wl-copy
        notify-send -t 1000 copied
        rm -f /tmp/scr
    fi
  '';
in
{
  home.packages = [ scr ];
}
