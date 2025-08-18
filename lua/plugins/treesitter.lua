return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "rust", "lua", "go", "terraform", "python", "markdown" },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

