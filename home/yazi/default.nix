{
  lib,
  pkgs,
  ...
}:
let
  openInLeftNvim = pkgs.writeShellApplication {
    name = "yazi-open-in-left-nvim";
    runtimeInputs = [
      pkgs.jq
      pkgs.neovim
      pkgs.zellij
    ];
    text = ''
      fallback() {
        exec nvim "$@"
      }

      if [[ -z "''${ZELLIJ_PANE_ID:-}" || -z "''${ZELLIJ_SESSION_NAME:-}" || -z "''${XDG_RUNTIME_DIR:-}" ]]; then
        fallback "$@"
      fi

      if [[ ! "$ZELLIJ_PANE_ID" =~ ^[0-9]+$ ]]; then
        fallback "$@"
      fi

      session_name="$ZELLIJ_SESSION_NAME"
      if ! panes="$(zellij --session "$session_name" action list-panes --json 2>/dev/null)"; then
        mapfile -t sessions < <(zellij list-sessions --short --no-formatting 2>/dev/null)
        if [[ "''${#sessions[@]}" -ne 1 ]]; then
          fallback "$@"
        fi

        session_name="''${sessions[0]}"
        panes="$(zellij --session "$session_name" action list-panes --json 2>/dev/null)" || fallback "$@"
      fi
      left_pane_id="$(
        jq --exit-status --raw-output --argjson origin_id "$ZELLIJ_PANE_ID" '
          . as $panes
          | (
              $panes[]
              | select(
                  (.is_plugin | not)
                  and .id == $origin_id
                  and (.exited | not)
                )
            ) as $origin
          | [
              $panes[]
              | select(
                  (.is_plugin | not)
                  and (.is_floating | not)
                  and (.is_suppressed | not)
                  and (.exited | not)
                  and .is_selectable
                  and .tab_id == $origin.tab_id
                  and (.pane_x + .pane_columns <= $origin.pane_x)
                )
              | . as $candidate
              | ([ $candidate.pane_y, $origin.pane_y ] | max) as $top
              | ([
                    $candidate.pane_y + $candidate.pane_rows,
                    $origin.pane_y + $origin.pane_rows
                  ] | min) as $bottom
              | select($bottom > $top)
              | {
                  id: $candidate.id,
                  gap: ($origin.pane_x - ($candidate.pane_x + $candidate.pane_columns)),
                  overlap: ($bottom - $top)
                }
            ]
          | sort_by([ .gap, (-.overlap), .id ])
          | .[0].id
        ' <<<"$panes"
      )" || fallback "$@"

      safe_session="''${ZELLIJ_SESSION_NAME//[^A-Za-z0-9_.-]/_}"
      safe_session="''${safe_session:0:32}"
      socket="$XDG_RUNTIME_DIR/nvim-zellij-$safe_session-$left_pane_id.sock"

      if [[ ! -S "$socket" ]]; then
        fallback "$@"
      fi

      exec nvim --server "$socket" --remote "$@"
    '';
  };
in
{
  programs.yazi = {
    enable = true;

    extraPackages = [ openInLeftNvim ];

    settings = {
      opener.nvim-left = [
        {
          run = "${lib.getExe openInLeftNvim} %s";
          block = true;
          desc = "Open in left Neovim";
          for = "unix";
        }
      ];

      open.prepend_rules = [
        {
          url = "*";
          use = "nvim-left";
        }
      ];
    };

    plugins.full-border = {
      package = pkgs.yaziPlugins.full-border;
      setup = true;
    };
  };
}
