{
  programs.nixvim.extraConfigLua = ''
    require("ibl").setup()
  '';
}
