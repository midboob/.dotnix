local nc = rawget(_G, 'nixCats') or require('nixCats')


return {
{
'mini.nvim',
enabled = nc('general') or false,
event = 'DeferredUIEnter',
after = function()
require('mini.pairs').setup()
require('mini.icons').setup()
require('mini.ai').setup()
end,
},
{
'which-key.nvim',
enabled = nc('general') or false,
event = 'DeferredUIEnter',
after = function()
local wk = require('which-key')
wk.setup({})
wk.add({
{ '<leader><leader>', group = 'buffer' },
{ '<leader>c', group = '[c]ode' },
{ '<leader>d', group = '[d]ocument' },
{ '<leader>g', group = '[g]it' },
{ '<leader>r', group = '[r]ename' },
{ '<leader>f', group = '[f]ind' },
{ '<leader>s', group = '[s]earch' },
{ '<leader>t', group = '[t]oggles' },
{ '<leader>w', group = '[w]orkspace' },
})
end,
},
{
'vim-startuptime',
enabled = nc('general') or false,
cmd = { 'StartupTime' },
before = function()
vim.g.startuptime_event_width = 0
vim.g.startuptime_tries = 10
vim.g.startuptime_exe_path = nc.packageBinPath
end,
},
}
