local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"nvim-lint",
		enabled = nc("general") or false,
		event = "FileType",
		after = function()
			local byft = {
				go = nc("go") and { "golangcilint" } or nil,
				-- markdown = { 'vale' },
				-- javascript = { 'eslint' },
				-- typescript = { 'eslint' },
			}
			require("lint").linters_by_ft = byft
			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"conform.nvim",
		enabled = nc("general") or false,
		event = "BufReadPre",
		keys = { { "<leader>FF", desc = "[F]ormat [F]ile" } },
		after = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = nc("lua") and { "stylua" } or nil,
					go = nc("go") and { "gofmt", "golint" } or nil,
					nix = nc("nix") and { "alejandra" } or nil,
				},
			})
			vim.keymap.set({ "n", "v" }, "<leader>FF", function()
				conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
			end, { desc = "[F]ormat [F]ile" })
		end,
	},
}
