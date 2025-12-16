-- put this in your main init.lua file ( before lazy setup )
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
vim.fn.mkdir(vim.g.base46_cache, "p")  -- ensure directory exists

-- run pywal/matugen generator *before* base46 loads
-- NOTE: no trailing '&' – we want this to finish before lazy/base46 runs
os.execute("python ~/.dotnix/home-manager/modules/nixcats/pywal/chadwal.py > /dev/null 2>&1")

require("nixCatsUtils").setup({
  non_nix_value = true,
})

-- Must be set before plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

-- Core config
require("config.options")
require("config.autocmds")
require("config.keymaps")

-- nixCats + lazy.nvim wrapper
local nixCats = require("nixCats")

local lazy_spec = {
  { import = "plugins" },
}

require("nixCatsUtils.lazyCat").setup(
  nixCats.pawsible({ "allPlugins", "start", "lazy.nvim" }),
  lazy_spec,
  {
    defaults = { lazy = true },
    ui = { border = "rounded" },
    checker = { enabled = false },
  }
)

-- after lazy setup: load cached base46 highlights
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- reload NvChad UI when you send SIGUSR1 (optional but fine)
local autocmd = vim.api.nvim_create_autocmd
autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    require("nvchad.utils").reload()
  end,
})
