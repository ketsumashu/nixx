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
      pkgs.herdr
    ];
    text = ''
      nvimx=${lib.escapeShellArg nvimxExe}

      fallback() {
        exec "$nvimx" "$@"
      }

      if [[ "''${HERDR_ENV:-}" != 1 || -z "''${HERDR_PANE_ID:-}" || -z "''${XDG_RUNTIME_DIR:-}" ]]; then
        fallback "$@"
      fi

      neighbor="$(herdr pane neighbor --direction left --current)" || fallback "$@"
      left_pane_id="$(jq --exit-status --raw-output '.result.neighbor.neighbor_pane_id' <<<"$neighbor")" || fallback "$@"

      left_pane="$(herdr pane get "$left_pane_id")" || fallback "$@"
      if [[ "$(jq --raw-output '.result.pane.label // empty' <<<"$left_pane")" != "nvim" ]]; then
        fallback "$@"
      fi

      safe_pane_id="''${left_pane_id//[^A-Za-z0-9_.-]/_}"
      safe_pane_id="''${safe_pane_id:0:64}"
      socket="$XDG_RUNTIME_DIR/nvim-herdr-$safe_pane_id.sock"

      if [[ -S "$socket" ]]; then
        nvim --clean --server "$socket" --remote "$@" || fallback "$@"
        exec herdr pane focus --direction left --current
      fi

      process_info="$(herdr pane process-info --pane "$left_pane_id")" || fallback "$@"
      left_process="$(jq --raw-output '.result.process_info.foreground_processes[0].name // empty' <<<"$process_info")"
      case "''${left_process#.}" in
        fish | bash | zsh | sh | dash | nu)
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
          herdr pane run "$left_pane_id" "$open_command" || fallback "$@"
          exec herdr pane focus --direction left --current
          ;;
        *)
          fallback "$@"
          ;;
      esac
    '';
  };
in
{
  programs.yazi = {
    enable = true;
    extraPackages = [ openInLeftNvim ];

    keymap.mgr.prepend_keymap = [
      {
        on = "<Enter>";
        run = "plugin smart-enter";
        desc = "Enter the child directory, or open the file";
      }
    ];

    settings = {
      mgr = {
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
    plugins = {
      full-border = {
        package = pkgs.yaziPlugins.full-border;
        setup = true;
      };
      smart-enter = pkgs.yaziPlugins.smart-enter;
    };
  };
}
