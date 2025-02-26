-- luacheck: globals vim
-- Set leader key
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core settings and key mappings
require("core.options")
require("core.keymaps")

-- Setup plugins via lazy.nvim using our plugin list
require("lazy").setup(require("plugins.plugin_list"))
