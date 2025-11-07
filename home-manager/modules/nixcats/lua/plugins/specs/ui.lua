local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	-- Lualine (statusline)
	{
		"lualine.nvim",
		enabled = nc("general") or false,
		event = "DeferredUIEnter",
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("lualine-lsp-progress")
		end,
		after = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "rose-pine",
					component_separators = "|",
					section_separators = "",
				},
				sections = { lualine_c = { { "filename", path = 1, status = true } } },
				inactive_sections = {
					lualine_b = { { "filename", path = 3, status = true } },
					lualine_x = { "filetype" },
				},
				tabline = { lualine_a = { "buffers" }, lualine_b = { "lsp_progress" }, lualine_z = { "tabs" } },
			})
		end,
	},
	{
		"transparent.nvim",
		enabled = nc("general") or false,
		event = "DeferredUIEnter",
	},
}
