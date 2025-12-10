-- lua/chadrc.lua
-- This is ONLY configuring base46; no nvchad-ui needed.

local M = {}

M.base46 = {
  theme = "onedark",      -- pick any base46 theme name
  transparency = false,

  -- optional: toggle pair if you ever hook up a theme switcher
  -- theme_toggle = { "onedark", "one_light" },
}

return M
