{ pkgs, ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = pkgs.lib.mkDefault true;
    servers = {
      bashls.enable = pkgs.lib.mkDefault true;
      nixd.enable = pkgs.lib.mkDefault true;
      lua_ls.enable = pkgs.lib.mkDefault true;
      cssls.enable = pkgs.lib.mkDefault true;
    };
  };

  programs.nixvim.plugins.lsp-format.enable = pkgs.lib.mkDefault false;
}
