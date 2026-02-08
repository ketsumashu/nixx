{ pkgs, ... }:
{
  programs.nixvim.plugins.lint = {
    enable = pkgs.lib.mkDefault true;
    lintersByFt = {
      text = [ ];
      markdown = [ ];
      nix = [ "nix" ];
    };
  };
}
