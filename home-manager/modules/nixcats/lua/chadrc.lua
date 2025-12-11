-- lua/chadrc.lua
local M = {}

-- base46 options
M.base46 = {
  theme = "onedark",     -- pick any base46 theme name you like
  transparency = true,   -- or false
}

-- UI options (optional, can be empty)
M.ui = {
  statusline = {
    theme = "minimal",
  },
  -- you can leave this empty to use defaults
}

return M
