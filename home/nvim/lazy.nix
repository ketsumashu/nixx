{ pkgs, ... }:
{
  imports = [
    ./lazy/cmp.nix
    ./lazy/appearance.nix
    ./lazy/skk.nix
    ./lazy/utils.nix
  ];
  programs.nixvim = {
    plugins.lazy = {
      enable = true;
      plugins = [
        {
          name = "indent-blankline-nvim";
          pkg = pkgs.vimPlugins.indent-blankline-nvim;
          event = [ "VimEnter" ];
        }
        {
          name = "nvim-cmp";
          pkg = pkgs.vimPlugins.nvim-cmp;
          dependencies = with pkgs.vimPlugins; [
            cmp-path
            cmp-buffer
            cmp-cmdline
            cmp_luasnip
            cmp-nvim-lsp
          ];
          event = [
            "InsertEnter"
            "CmdlineEnter"
          ];
        }
        {
          name = "LuaSnip";
          pkg = pkgs.vimPlugins.luasnip;
          event = [ "InsertEnter" ];
        }
        {
          name = "skkeleton";
          pkg = pkgs.vimUtils.buildVimPlugin {
            name = "skkeleton";
            src = pkgs.fetchFromGitHub {
              owner = "vim-skk";
              repo = "skkeleton";
              rev = "8bb1b8782227291c8cbe2aa62a9af732557690cc";
              hash = "sha256-V86J+8rg1/5ZUL9t0k2S5H+z7KZ1DZwLwmb5yM0+vts=";
            };
          };
          dependencies = with pkgs.vimPlugins; [ denops-vim ];
          lazy = false;
        }
        {
          name = "nvim-bufdel";
          pkg = pkgs.vimPlugins.nvim-bufdel;
          event = [ "VimEnter" ];
        }
        {
          name = "nvim-autopairs";
          pkg = pkgs.vimPlugins.nvim-autopairs;
          event = [ "InsertEnter" ];
        }
        {
          name = "alpha";
          pkg = pkgs.vimPlugins.alpha-nvim;
          event = [ "VimEnter" ];
        }
        {
          name = "substrata";
          pkg = pkgs.vimPlugins.substrata-nvim;
          event = [ "VimEnter" ];
        }
        {
          name = "telescope";
          pkg = pkgs.vimPlugins.telescope-nvim;
          dependencies = with pkgs.vimPlugins; [
            plenary-nvim
            telescope-file-browser-nvim
          ];
          event = [ "VimEnter" ];
        }
      ];
    };
  };
}
