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

-- Base46: compile + apply theme (including chadwal)
local ok_base46, base46 = pcall(require, "base46")
if ok_base46 then
  base46.load_all_highlights()
end

-- Pywal / Matugen watcher: runs in background and sends SIGUSR1 to nvim
os.execute("python ~/.dotnix/home-manager/modules/nixcats/pywal/chadwal.py &> /dev/null &")

-- When the watcher sends SIGUSR1, re-run base46 so new colors apply
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    local ok, b46 = pcall(require, "base46")
    if ok then
      b46.load_all_highlights()
    end
  end,
})
