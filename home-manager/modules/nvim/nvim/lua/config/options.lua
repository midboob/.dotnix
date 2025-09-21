local go = vim.g
local o = vim.opt

-- Optimizations on startup
vim.loader.enable()

-- LazyVim global options
go.lazyvim_cmp = "blink"
go.lazyvim_picker = "snacks"

-- Define leader key
go.mapleader = " "
go.maplocalleader = "\\"

-- Autoformat on save (Global)
go.autoformat = true

-- Font
go.gui_font_default_size = 10
go.gui_font_size = go.gui_font_default_size
go.gui_font_face = "JetBrainsMono Nerd Font"

-- Enable EditorConfig integration
go.editorconfig = true

-- Root dir detection
go.root_spec = {
  "lsp",
  { ".git", "lua", ".obsidian", "package.json", "Makefile", "go.mod", "cargo.toml", "pyproject.toml", "src" },
  "cwd",
}

-- Disable annoying cmd line stuff
o.showcmd = false
o.laststatus = 3
o.cmdheight = 0

-- Disable native bufferline
o.showtabline = 0

-- Enable spell checking
o.spell = true
o.spelllang:append("en")

-- Backspacing and indentation when wrapping
o.backspace = { "start", "eol", "indent" }
o.breakindent = true

-- Smoothscroll
if vim.fn.has("nvim-0.10") == 1 then
  o.smoothscroll = true
end

-- Use system clipboard
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Wrap lines at convenient points
o.wrap = true
o.linebreak = true

-- Set conceallevel
o.conceallevel = 2

-- Disable swap files
o.swapfile = false
