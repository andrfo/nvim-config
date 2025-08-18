return {
  "numToStr/Comment.nvim",
  opts = {
    mappings = {
      basic = false,
      extra = false,
    },
  },
  keys = {
    { "<leader>/", function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle comment" },
    { "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = "x", desc = "Toggle comment" },
  },
}

