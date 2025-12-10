local nc = rawget(_G, "nixCats") or require("nixCats")

local matugen_file = vim.fn.expand("~/.config/matugen/generated/matugen-neovim.lua")

local ok, err = pcall(dofile, matugen_file)
if not ok then
  vim.notify("matugen theme not loaded: " .. err, vim.log.levels.WARN)
end
