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

 for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
   dofile(vim.g.base46_cache .. v)
 end

