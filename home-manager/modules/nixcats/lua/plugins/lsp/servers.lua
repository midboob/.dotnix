local nc = rawget(_G, "nixCats") or require("nixCats")
local on_attach = require("plugins.lsp.on_attach").on_attach

return {
	-- Base lspconfig + global defaults
	{
		"nvim-lspconfig",
		enabled = nc("general") or false,
		on_require = { "lspconfig" },
		lsp = function(plugin) -- consumed by lzextras handler
			vim.lsp.config(plugin.name, plugin.lsp or {})
			vim.lsp.enable(plugin.name)
		end,
		before = function()
			vim.lsp.config("*", { on_attach = on_attach })
		end,
	},

	-- Lua
	{
		"lua_ls",
		enabled = nc("lua") or false,
		lsp = {
			filetypes = { "lua" },
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					formatters = { ignoreComments = true },
					signatureHelp = { enabled = true },
					diagnostics = { globals = { "nixCats", "vim" }, disable = { "missing-fields" } },
					telemetry = { enabled = false },
				},
			},
		},
	},

	-- Go
	{
		"gopls",
		enabled = nc("go") or false,
		lsp = { -- omit filetypes to use lspconfig fallback we registered
			-- filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
		},
	},

	-- Nix
	{
		"nixd",
		enabled = nc("nix") or false,
		lsp = {
			filetypes = { "nix" },
			settings = {
				nixd = {
					nixpkgs = { expr = nc.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]] },
					options = {
						nixos = { expr = nc.extra("nixdExtras.nixos_options") },
						["home-manager"] = { expr = nc.extra("nixdExtras.home_manager_options") },
					},
					formatting = { command = { "alejandra" } },
					diagnostic = { suppress = { "sema-escaping-with" } },
				},
			},
		},
	},

	{
		"tinymist",
		enabled = nc("typst") or false,
		lsp = {
			filetypes = { "typst" },
			settings = {
				formatterMode = "typstyle",
				exportPdf = "onType",
				semanticTokens = "disable",
				outputPath = "$dir/$name",
			},
		},
	},
}
