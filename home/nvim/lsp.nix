{
  programs.nixvim.plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };
    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
        };
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
