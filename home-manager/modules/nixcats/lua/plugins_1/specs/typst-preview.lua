local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"typst-preview.nvim",
		enabled = nc("general") or false,
		event = "FileType",
		ft = "typst",
		after = function()
			require("typst-preview").setup({
				follow_cursor = true,
				port = 1234,
			})
		end,
	},
}
