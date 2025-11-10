-- [[ Options ]]
local opt = vim.opt

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.g.snacks_animate = true

opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

opt.inccommand = 'split'
opt.scrolloff = 10

-- window-local defaults (applies to current win + future wins)
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = true

opt.mouse = 'a'

-- You likely meant shortmess (hide intro) instead of cpoptions
opt.shortmess:append('I')

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = { 'menu', 'preview', 'noselect' }
opt.termguicolors = true

-- Clipboard: disable under SSH, else use system clipboard
if vim.env.SSH_CONNECTION then
  opt.clipboard = ''
else
  opt.clipboard = 'unnamedplus'
end

-- Colorscheme (guard in case it's missing)
pcall(vim.cmd.colorscheme, 'rose-pine')
