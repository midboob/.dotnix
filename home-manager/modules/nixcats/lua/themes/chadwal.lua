local M = {}

local lighten = require("base46.colors").change_hex_lightness

M.base_30 = {
  white = "#dfe4dc",
  black = "#101510",
  darker_black = lighten("#101510", -3),
  black2 = lighten("#101510", 6),
  one_bg = lighten("#101510", 10),
  one_bg2 = lighten("#101510", 16),
  one_bg3 = lighten("#101510", 22),
  grey = "#414941",
  grey_fg = lighten("#414941", -10),
  grey_fg2 = lighten("#414941", -20),
  light_grey = "#8b938a",
  red = "#ffb595",
  baby_pink = lighten("#ffb595", 10),
  pink = "#a2ceda",
  line = "#8b938a",
  green = "#9dd49e",
  vibrant_green = lighten("#9dd49e", 10),
  blue = "#afc6ff",
  nord_blue = lighten("#afc6ff", 10),
  yellow = "#b8cf84",
  sun = lighten("#b8cf84", 10),
  purple = "#a2ceda",
  dark_purple = lighten("#a2ceda", -10),
  teal = "#384b3c",
  orange = "#ffb595",
  cyan = "#84d5c4",
  statusline_bg = lighten("#101510", 6),
  pmenu_bg = "#414941",
  folder_bg = lighten("#96d5a6", 0),
  lightbg = lighten("#101510", 10),
}

M.base_16 = {
  base00 = "#101510",
  base01 = lighten("#414941", 0),
  base02 = lighten("#414941", 3),
  base03 = lighten("#8b938a", 0),
  base04 = lighten("#c1c9bf", 0),
  base05 = "#dfe4dc",
  base06 = lighten("#dfe4dc", 0),
  base07 = "#101510",
  base08 = "#ffb595",
  base09 = "#b8cf84",
  base0A = "#afc6ff",
  base0B = "#9dd49e",
  base0C = "#84d5c4",
  base0D = lighten("#afc6ff", 20),
  base0E = "#a2ceda",
  base0F = "#dfe4dc",
}

M.type = "dark"

M.polish_hl = {
  defaults = {
    Comment = {
      italic = true,
      fg = M.base_16.base03,
    },
  },
  Syntax = {
    String = {
      fg = "#a2ceda",
    },
  },
  treesitter = {
    ["@comment"] = {
      fg = M.base_16.base03,
    },
    ["@string"] = {
      fg = "#a2ceda",
    },
  },
}

return M
