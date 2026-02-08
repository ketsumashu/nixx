{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      alpha-nvim
    ];

    extraConfigLua = builtins.readFile ./alpha.lua;
  };
}
