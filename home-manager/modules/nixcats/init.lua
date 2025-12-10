-- Must be set before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

-- Base46 cache dir (used when compiling highlights)
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- Core config
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- Plugins (lze specs)
require('plugins')

-- package.loaded["nvconfig"] = {
--   base46 = {
--     theme = "chadwal",     -- this is now the source of truth
--     transparency = true,
--   },
-- }
--
-- Base46: compile + apply theme (including chadwal)
 for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
   dofile(vim.g.base46_cache .. v)
 end

-- Pywal / Matugen watcher: runs in background and sends SIGUSR1 to nvim
os.execute("python ~/.dotnix/home-manager/modules/nixcats/pywal/chadwal.py &> /dev/null &")

local autocmd = vim.api.nvim_create_autocmd

autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    require('nvchad.utils').reload()
  end
})
