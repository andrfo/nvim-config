return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local tokyonight = {
      style = "storm",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      on_highlights = function(highlights, colors)
        highlights.LineNr = {
          fg = colors.comment,
        }
      end,
    }
    require("tokyonight").setup(tokyonight)
    vim.cmd.colorscheme("tokyonight")
  end,
}

