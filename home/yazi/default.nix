{
  config,
  lib,
  pkgs,
  ...
}:
let
  nvimxExe = lib.getExe' config.programs.nvimx.env.wrapped "nvim";
  openInLeftNvim = pkgs.writeShellApplication {
    name = "yazi-open-in-left-nvim";
    runtimeInputs = [
      pkgs.fish
      pkgs.jq
      pkgs.neovim
      pkgs.zellij
    ];
    text = ''
      nvimx=${lib.escapeShellArg nvimxExe}

      fallback() {
        exec "$nvimx" "$@"
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
        left_pane_command="$(
          jq --exit-status --raw-output --argjson pane_id "$left_pane_id" '
            .[]
            | select(
                (.is_plugin | not)
                and .id == $pane_id
                and (.exited | not)
              )
            | .pane_command // empty
          ' <<<"$panes"
        )" || fallback "$@"

        if [[ "''${left_pane_command##*/}" == "fish" ]]; then
          absolute_paths=()
          for path in "$@"; do
            if [[ "$path" == /* ]]; then
              absolute_paths+=("$path")
            else
              absolute_paths+=("$PWD/$path")
            fi
          done

          open_command="$(
            # This command is evaluated by fish, which expands $argv itself.
            # shellcheck disable=SC2016
            fish -c 'string escape -- $argv | string join " "' \
              -- "$nvimx" -- "''${absolute_paths[@]}"
          )"
          zellij --session "$session_name" action write-chars \
            --pane-id "$left_pane_id" "$open_command" || fallback "$@"
          zellij --session "$session_name" action send-keys \
            --pane-id "$left_pane_id" Enter || fallback "$@"
          exec zellij --session "$session_name" action focus-pane-id "$left_pane_id"
        fi

        fallback "$@"
      fi

      nvim --server "$socket" --remote "$@"
      exec zellij --session "$session_name" action focus-pane-id "$left_pane_id"
    '';
  };
in
{
  programs.yazi = {
    enable = true;

    extraPackages = [ openInLeftNvim ];

    settings = {
      yazi = {
        ratio = [
          0
          1
          2
        ];
        sort_by = "natural";
        sort_dir_first = true;
        show_hidden = true;
        show_symlink = true;
      };
    };

    keymap.mgr.prepend_keymap = [
      {
        on = "<Enter>";
        run = "plugin smart-enter";
        desc = "Enter the child directory, or open the file";
      }
    ];

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

    plugins.smart-enter = pkgs.yaziPlugins.smart-enter;
  };
}
