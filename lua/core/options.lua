-- luacheck: globals vim
-- Core options
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = '●', -- you can choose your own symbol
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})
