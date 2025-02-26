-- Colorscheme configuration
return {
  -- Options for tokyonight
  tokyonight = {
    style = "storm", -- Options: storm, moon, night, day
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
      -- Customize highlights here if needed
      highlights.LineNr = {
        fg = colors.comment,
      }
    end,
  },
}
