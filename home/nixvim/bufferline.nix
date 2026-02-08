{ pkgs, ... }:
{
  programs.nixvim.plugins.bufferline = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      options = {
        alwaysShowBufferline = pkgs.lib.mkDefault true;
        offsets = [
          {
            filetype = "NvimTree";
            text = "Explorer";
            highlight = "NvimTreeNormal";
            padding = 1;
          }
        ];
      };
    };
  };
}
