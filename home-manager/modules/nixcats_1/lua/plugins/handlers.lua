-- Register lze handlers (must run before any specs that use them)
local nc = rawget(_G, 'nixCats') or require('nixCats')


require('lze').register_handlers(require('lzextras').lsp)


-- Faster fallback filetype lookup for lsp servers
require('lze').h.lsp.set_ft_fallback(function(name)
return dofile(nc.pawsible({ 'allPlugins', 'opt', 'nvim-lspconfig' }) .. '/lsp/' .. name .. '.lua').filetypes or {}
end)
