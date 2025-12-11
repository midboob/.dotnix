local M = {}

-- Base46 / theme options
M.base46 = {
  theme = "everforest",  -- pick any base46 theme (onedark, everforest, gruvchad, etc.)
  transparency = true,
}

-- Core UI config (statusline, bufferline, etc.)
M.ui = {
  -- Statusline style: "default", "vscode", "vscode_colored", "minimal"
  statusline = {
    theme = "vscode_colored",
    separator_style = "round", -- "block", "arrow", "round"
  },

  -- Tab/buffer line (tabufline)
  tabufline = {
    enabled = true,
    lazyload = false,
  },

  -- Dashboard
  -- nvdash = {
  --   load_on_startup = true,
  --   header = {
  --     "   _   _      _   _____      _        ",
  --     "  | \\ | | ___| |_| ____|_  _| |_ ___  ",
  --     "  |  \\| |/ _ \\ __|  _| \\ \\/ / __/ _ \\ ",
  --     "  | |\\  |  __/ |_| |___ >  <| || (_) |",
  --     "  |_| \\_|\\___|\\__|_____/_/\\_\\\\__\\___/ ",
  --   },
  -- },

  cmp = {
    style = "default", -- "default", "flat_light", "flat_dark", etc.
  },

  telescope = {
    style = "bordered", -- "borderless", "bordered", "bordered_full"
  },
}

-- You can also configure:
-- M.term, M.mason, M.lsp, M.dap, M.cheatsheet, etc.
-- see :h nvui and nvchad.com docs

return M
