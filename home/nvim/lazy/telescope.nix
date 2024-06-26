{
  programs.nixvim.extraConfigLua = ''
    local actions = require "telescope.actions"
    require("telescope").setup {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
              mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        winblend = 0,
        set_env = { ["COLORTERM"] = "truecolor" },
        mappings = {
          ["n"] = {
              ["q"] = actions.close
          },
        },
        file_ignore_patterns = {
          "tmp",
          ".git",
          ".rustup",
          ".npm",
        }
      },
      pickers = {
        find_files = {
          hidden = true,
          disable_devicons = false,
        }
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          hidden = true,
          hijack_netrw = true,
          disable_devicons = true,
          mappings = {
            ["i"] = {
            },
            ["n"] = {
              ["q"] = actions.close
            },
          },
        },
      }
    }
    require 'telescope'.load_extension "file_browser"
  ''
}
