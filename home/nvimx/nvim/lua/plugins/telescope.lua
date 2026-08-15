return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-frecency.nvim",
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
          buffers = {
            theme = "dropdown",
            mappings = {
              i = { ["<leader>b"] = actions.close },
              n = { ["<leader>b"] = actions.close },
            },
          },
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

      for _, extension in ipairs({ "undo", "fzf", "frecency" }) do
        telescope.load_extension(extension)
      end
    end,
  },
}
