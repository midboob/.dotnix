require("nixCatsUtils").setup {
  non_nix_value = true,
}

-- Must be set before plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

 -- put this in your main init.lua file ( before lazy setup )
 vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- Core config
require("config.options")
require("config.autocmds")
require("config.keymaps")

-- nixCats + lazy.nvim wrapper
local nixCats = require("nixCats")

-- Your lazy spec comes from lua/plugins.lua now
local lazy_spec = {
  { import = "plugins" },
}

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

 for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
   dofile(vim.g.base46_cache .. v)
 end
