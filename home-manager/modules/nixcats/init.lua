-- Must be set before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

-- Core config
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- Plugins (lze specs)
require('plugins')

 -- put this in your main init.lua file ( before lazy setup )
 vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- (method 2, for non lazyloaders) to load all highlights at once
 for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
   dofile(vim.g.base46_cache .. v)
 end
