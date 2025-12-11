-- Must be set before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- Core config
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- Plugins (lze specs)
require('plugins')

local cache = vim.g.base46_cache

-- If cache is empty (first run / after changing themes) compile highlights:
if vim.fn.isdirectory(cache) == 0 or vim.fn.empty(vim.fn.readdir(cache)) == 1 then
  require("base46").load_all_highlights()
end

-- Then source the compiled highlight files (method 2 from the README)
for _, f in ipairs(vim.fn.readdir(cache)) do
  dofile(cache .. "/" .. f)
end

