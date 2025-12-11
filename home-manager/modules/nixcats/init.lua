-- Must be set before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

vim.fn.mkdir(vim.g.base46_cache, "p")

-- Core config
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- Plugins (lze specs)
require('plugins')

-- (method 2, for non lazyloaders) to load all highlights at once
 for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
   dofile(vim.g.base46_cache .. v)
 end
