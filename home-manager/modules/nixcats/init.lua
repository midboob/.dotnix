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


-- Matugen
-- local matugen_output = os.getenv("HOME") .. "/.config/matugen/generated/matugen-nvim.lua"
--
-- local function source_matugen()
--   local file, err = io.open(matugen_output, "r")
--
--   if err ~= nil or not file then
--     -- Fallback theme: must be installed (base16-catppuccin-mocha, or any base16 scheme you like)
--     vim.cmd("colorscheme base16-gruvbox-dark")
--     vim.print("Matugen style file not found yet; using fallback colorscheme.")
--     return
--   end
--
--   io.close(file)
--   dofile(matugen_output)
-- end
--
-- -- Main entrypoint on matugen reloads
-- local function auxiliary_function()
--   -- load fresh matugen colors
--   source_matugen()
--
--   -- reload lualine (adjust path to wherever nixCats generates your lualine config)
--   pcall(dofile, os.getenv("HOME") .. "/.dotnix/home-manager/modules/nixcats/lua/plugins/specs/ui.lua")
--
--   -- any extra tweaks that should reapply on every reload
--   vim.api.nvim_set_hl(0, "Comment", { italic = true })
-- end
--
-- -- Listen for the signal Matugen sends
-- vim.api.nvim_create_autocmd("Signal", {
--   pattern = "SIGUSR1",
--   callback = auxiliary_function,
-- })
--
-- -- Run once on startup, so you get a theme even before matugen runs
-- auxiliary_function()

-- nvchad-ui
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

pcall(function()
  require("base46").load_all_highlights()
end)

os.execute("python ~/.dotnix/home-manager/modules/nixcats/pywal/chadwal.py &> /dev/null &")

local autocmd = vim.api.nvim_create_autocmd

autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    require('nvchad.utils').reload()
  end
})

os.execute("python ~/.dotnix/home-manager/modules/nixcats/pywal/chadwal.py &> /dev/null &")

local autocmd = vim.api.nvim_create_autocmd

autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    require('nvchad.utils').reload()
  end
})
