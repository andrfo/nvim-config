-- telescope.nvim configuration
return {
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        width = 0.8,
        height = 0.9,
        preview_height = 0.5,
      },
    },
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      "target/",
    },
    path_display = { "truncate" },
    winblend = 10,
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    },
  },
  extensions = {
    -- Add any telescope extensions you might want to use in the future
  }
}
