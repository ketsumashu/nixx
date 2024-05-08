{
  programs.nixvim.plugins.lualine.enable = true;
  programs.nixvim.extraConfigLua = builtins.readFile ./statusline.lua;
}
