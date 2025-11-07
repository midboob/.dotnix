-- Must be set before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Core config
require('config.options')
require('config.autocmds')
require('config.keymaps')


-- Plugins (lze specs)
require('plugins')
