{ pkgs, ... }:
{
  programs.nixvim.plugins = {
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

        au.get_rules("{")[1]:with_pair(cond.not_filetypes({"nix"}))
        au.add_rules({
          Rule("{", "};", "nix")
            :with_pair(cond.not_after_regex("}"))
        })
      '';
    };
    lastplace.enable = pkgs.lib.mkDefault true;
    nvim-tree = {
      enable = pkgs.lib.mkDefault false;
      settings = {
        update_focused_file.enable = pkgs.lib.mkDefault true;
      };
    };
    toggleterm = {
      enable = pkgs.lib.mkDefault true;
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
    colorizer.enable = pkgs.lib.mkDefault true;
    web-devicons.enable = true;
    bufdelete.enable = true;
  };
}
