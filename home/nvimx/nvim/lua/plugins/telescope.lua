return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top" },
          },
          mappings = {
            i = {
              ["<C-,>"] = actions.move_selection_next,
              ["<C-.>"] = actions.move_selection_previous,
            },
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              q = actions.close,
            },
          },
        },
        pickers = {
          find_files = { theme = "dropdown" },
          git_files = { theme = "dropdown" },
          fd = { theme = "dropdown" },
          buffers = { theme = "dropdown" },
          marks = { theme = "dropdown" },
          registers = { theme = "dropdown" },
          jumplist = { theme = "dropdown" },
          git_branches = { theme = "dropdown" },
          git_commits = { theme = "dropdown" },
          live_grep = { theme = "ivy" },
          current_buffer_fuzzy_find = { theme = "ivy" },
          help_tags = { theme = "dropdown" },
          man_pages = { theme = "ivy" },
          keymaps = { theme = "dropdown" },
          vim_options = { theme = "dropdown" },
          commands = { theme = "dropdown" },
        },
        extensions = {
          file_browser = {
            hidden = { file_browser = true, folder_browser = true },
            hijack_netrw = true,
            layout_config = {
              anchor = "SE",
              height = 0.4,
              width = 0.5,
              prompt_position = "top",
            },
            layout_strategy = "vertical",
            previewer = false,
            select_buffer = true,
            sorting_strategy = "ascending",
            theme = "dropdown",
            use_fd = true,
          },
          frecency = {
            defaultWorkspace = "CWD",
            showUnindexed = true,
          },
          fzf = {
            caseMode = "smart_case",
          },
          undo = {
            useDelta = true,
          },
        },
      })

      for _, extension in ipairs({ "undo", "fzf", "frecency", "file_browser" }) do
        telescope.load_extension(extension)
      end
    end,
  },
}
