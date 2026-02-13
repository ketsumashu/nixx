{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lz-n.enable = true;
    nvim-autopairs = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        checkTs = true;
        map_cr = true;
      };
      luaConfig.post = ''
        local au = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        -- 1. まず、デフォルトの "{" ルールを nix ファイルで無効化（これはそのままでOK）
        au.get_rules("{")[1]:with_pair(cond.not_filetypes({"nix"}))

        -- 2. nix用の { }; ルールを追加
        au.add_rules({
          Rule("{", "};", "nix")
            :with_pair(cond.not_after_regex("}")),

          -- 3. 【ここが重要！】 { と }; の間で Enter を押した時の挙動を定義
          -- これを追加することで、autopairsに「この間でもインデントして！」って教えるよ
          Rule("{", "};", "nix")
            :with_pair(function() return false end) -- 普通に打った時は反応させない
            :with_move(function(opts)
                return opts.prev_char:match("{") and opts.next_char:match("};")
            end)
            :use_key("<cr>") -- Enterキーを押した時にこのルールを発動！
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
