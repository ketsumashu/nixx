{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lz-n.enable = true;
    nvim-autopairs = {
      enable = pkgs.lib.mkDefault true;
      settings.checkTs = pkgs.lib.mkDefault true;
      luaConfig.post = ''
        local au = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        -- 1. 標準の "{" ルールから nix を除外する (競合回避)
        local brkts = au.get_rules("{")
        for _, rule in ipairs(brkts) do
          rule:with_pair(cond.not_filetypes({"nix"}))
        end

        -- 2. nix専用のルールを追加
        au.add_rules({
          Rule("{", "};", "nix")
            -- Enterを押したときに自動でインデントして改行を入れる設定
            :append_pair_if_newline()
            -- カーソルの後ろに既に文字がある場合は補完しない
            :with_pair(cond.not_after_regex("."))
        })
      '';
    };
    lastplace.enable = pkgs.lib.mkDefault true;
    sleuth.enable = pkgs.lib.mkDefault true;
    nvim-tree = {
      enable = pkgs.lib.mkDefault false;
      settings = {
        update_focused_file.enable = pkgs.lib.mkDefault true;
      };
    };
    nvim-ufo.enable = pkgs.lib.mkDefault true;
    toggleterm = {
      enable = pkgs.lib.mkDefault true;
      lazyload.settings.cmd = "ToggleTerm";
      settings = {
        direction = "horizontal";
        floatOpts = {
          border = "shadow";
        };
        shell = "fish";
        terminalMappings = pkgs.lib.mkDefault true;
        size = ''
          function(term)
            if term.direction == "horizontal" then
              return 15
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.4
            end
          end
        '';
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
    bufdelete.enable = true;
  };
}
