{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    nvim-autopairs = {
      enable = pkgs.lib.mkDefault true;
      settings.checkTs = pkgs.lib.mkDefault true;
    };
    crates.enable = pkgs.lib.mkDefault true;
    bacon.enable = pkgs.lib.mkDefault true;
    rustaceanvim.enable = pkgs.lib.mkDefault true;
    lastplace.enable = pkgs.lib.mkDefault true;
    todo-comments = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        mergeKeywords = pkgs.lib.mkDefault true;
        highlight = {
          before = "";
          after = "fg";
          keyword = "wide";
        };
        keywords = {
          QUESTION = {
            icon = "";
          };
        };
      };
    };
    comment.enable = pkgs.lib.mkDefault true;
    sleuth.enable = pkgs.lib.mkDefault true;
    nvim-tree = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        update_focused_file.enable = pkgs.lib.mkDefault true;
      };
      luaConfig__raw = ''
        local function open_win_config_func()
          local scr_w = vim.opt.columns:get()
          local scr_h = vim.opt.lines:get()
          local tree_w = 80
          local tree_h = math.floor(tree_w * scr_h / scr_w)
          return {
            border = "double",
            relative = "editor",
            width = tree_w,
            height = tree_h,
            col = (scr_w - tree_w) / 2,
            row = (scr_h - tree_h) / 2
          }
        end
        float = {
         enable = true,
         open_win_config = open_win_config_func
        },
      '';
    };
    nvim-ufo.enable = pkgs.lib.mkDefault true;
    toggleterm = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        direction = "float";
        floatOpts = {
          border = "single";
        };
        terminalMappings = pkgs.lib.mkDefault true;
      };
    };
    illuminate = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        under_cursor = pkgs.lib.mkDefault true;
      };
    };
    navic = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        highlight = pkgs.lib.mkDefault true;
        lsp.autoAttach = pkgs.lib.mkDefault true;
      };
    };
    colorizer.enable = pkgs.lib.mkDefault true;
    marks.enable = pkgs.lib.mkDefault true;
    vim-matchup = {
      enable = pkgs.lib.mkDefault true;
      settings = pkgs.lib.mkDefault {
        surround_enabled = pkgs.lib.mkDefault 1;
        transmute_enabled = pkgs.lib.mkDefault 1;
      };
      treesitter = pkgs.lib.mkDefault {
        enable = pkgs.lib.mkDefault true;
      };
    };
    web-devicons.enable = true;
    typst-preview = {
      enable = true;
      settings = {
        dependencies_bin = {
          tinymist = "${pkgs.tinymist}/bin/tinymist";
          websocat = "${pkgs.websocat}/bin/websocat";
        };
      };
    };
  };
}
