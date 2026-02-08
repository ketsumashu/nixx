{ pkgs, ... }:
{
  programs.nixvim.plugins.notify = {
    enable = pkgs.lib.mkDefault true;
    settings = {
      level = "info";
      background_color = "#131313";
    };
  };
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      presets = {
        bottom_search = false;
        command_palette = true;
        long_message_to_split = false;
        lsp_doc_border = true;
        inc_rename = true;
      };
      notify.enabled = true;
      messages.enabled = true;
    };
  };
}
