-- [[ Options ]]
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.g.snacks_animate = true

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


vim.opt.inccommand = 'split'
vim.opt.scrolloff = 10


vim.wo.number = true
vim.wo.relativenumber = true


vim.o.mouse = 'a'
vim.opt.cpoptions:append('I')
vim.o.expandtab = true
vim.o.cursorline = true

vim.o.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'


vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menu,preview,noselect'
vim.o.termguicolors = true


-- Colorscheme (set early so UIs can pick it up)
vim.cmd.colorscheme('rose-pine')
