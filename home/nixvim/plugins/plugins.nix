{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lz-n.enable = true;
    nvim-autopairs = {
      enable = pkgs.lib.mkDefault true;
      settings.checkTs = pkgs.lib.mkDefault true;
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
