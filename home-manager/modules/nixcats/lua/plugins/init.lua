local nc = rawget(_G, 'nixCats') or require('nixCats')


-- Ensure handlers are registered first
require('plugins.handlers')


local specs = {}
local function extend(list)
for _, x in ipairs(list) do table.insert(specs, x) end
end


extend(require('plugins.specs.ui'))
extend(require('plugins.specs.treesitter'))
extend(require('plugins.specs.cmp'))
-- extend(require('plugins.specs.git'))
extend(require('plugins.specs.misc'))
extend(require('plugins.specs.lint_fmt'))
extend(require('plugins.specs.dap'))
extend(require('plugins.lsp.servers'))
extend(require('plugins.specs.snacks'))
extend(require('plugins.specs.yazi'))
extend(require('plugins.specs.render-markdown'))
extend(require('plugins.specs.obsidian'))
extend(require('plugins.specs.markdown-preview'))
extend(require('plugins.specs.typst-preview'))
extend(require('plugins.specs.mini'))
extend(require('plugins.specs.fidget'))


require('lze').load(specs)
