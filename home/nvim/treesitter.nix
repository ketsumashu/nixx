{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        nix
        lua
        vim
      ];
      settings = {
        auto_install = false;
        indent.enable = true;
      };
    };
  };
}
