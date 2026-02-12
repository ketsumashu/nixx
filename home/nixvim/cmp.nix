{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    luasnip = {
      enable = pkgs.lib.mkDefault true;
      settings = {
        enable_autosnippets = pkgs.lib.mkDefault true;
      };
    };

    cmp = {
      enable = pkgs.lib.mkDefault true;
      autoEnableSources = pkgs.lib.mkDefault true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "git"; }
          { name = "calc"; }
        ];

        mapping = {
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        window = {
          completion = {
            winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
            scrollbar = false;
            sidePadding = 0;
            border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
          };

          settings.documentation = {
            border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
            winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
          };
        };
      };
    };
    luaConfig.post = ''
      local cmp_autopairs = require('nvim-autopairs.completion.cmp)
      require('cmp').event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    '';
  };
}
