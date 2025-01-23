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
          name = "eskk.vim";
          pkg = pkgs.vimUtils.buildVimPlugin {
            name = "eskk.vim";
            src = pkgs.fetchFromGitHub {
              owner = "vim-skk";
              repo = "eskk.vim";
              rev = "e530575790cca5d6603b8ab984298459ecf3c0c0";
              hash = "sha256-7nPzxCbKHBwplrTCsO4SxdFe/VK0VMHWDspWvVJvwLU=";
            };
          };
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
