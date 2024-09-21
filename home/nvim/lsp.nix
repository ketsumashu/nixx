{
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gf" = "format";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
  };
}
