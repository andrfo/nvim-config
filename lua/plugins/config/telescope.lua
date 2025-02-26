-- telescope.nvim configuration
return {
  defaults = {
    layout_strategy = "vertical",
    -- Additional telescope options can be set here.
  },
  setup = function()
    require("telescope.builtin").colorscheme({
      enable_preview = true,
    })
  end,
}
