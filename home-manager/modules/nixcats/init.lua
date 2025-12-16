-- Must be set before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
vim.fn.mkdir(vim.g.base46_cache, "p")

-- nixCats utils (lets config also work outside Nix if you ever do that)
require("nixCatsUtils").setup {
  non_nix_value = true,  -- can be left as-is
}

-- Core config
require("config.options")
require("config.autocmds")
require("config.keymaps")

-- nixCats + lazy.nvim wrapper
local nixCats = require("nixCats")

-- Your lazy spec comes from lua/plugins.lua now
local lazy_spec = require("plugins") -- make plugins.lua `return { ... }`

require("nixCatsUtils.lazyCat").setup(
  nixCats.pawsible({ "allPlugins", "start", "lazy.nvim" }), -- Nix path to lazy
  lazy_spec,
  {
    defaults = {
      lazy = true,
    },
    ui = {
      border = "rounded",
    },
    checker = {
      enabled = false,
    },
  }
)

-- base46 highlight cache
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
