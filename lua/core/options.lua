-- luacheck: globals vim
-- Core options
vim.opt.clipboard = "unnamed,unnamedplus" -- Sync yank operations with both * and + registers
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = { current_line = true },
  float = { border = "rounded", },
  underline = true,
  update_in_insert = false,
})
