{
  programs.nixvim.extraConfigLuaPost = builtins.readFile ./extra.lua;
}
