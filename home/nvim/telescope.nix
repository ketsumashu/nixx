{
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "bottom";
            preview_width = 0.55;
            results_width = 0.8;
          };
          vertical.mirror = false;
          width = 0.87;
          height = 0.8;
          preview_cutoff = 120;
        };
        winblend = 0;
        mappings = {
          n = {
            "q" = {
              __raw = "require \"telescope.actions\".close";
            };
          };
        };
        file_ignore_patterns = [
          "tmp"
          ".git"
        ];
      };
      pickers.find_files = {
        hidden = true;
        disable_devicons = true;
      };
    };
    extensions = {
      file-browser = {
        enable = true;
        settings = {
          theme = "dropdown";
          hidden = true;
          hijack_netrw = true;
          disable_devicons = true;
        };
      };
    };
  };
}
