{
  programs.nixvim.extraConfigLua = builtins.readFile ./stl.lua;
}
