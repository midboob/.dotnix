local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"markdown-preview.nvim",
		enabled = nc("general") or false,
		event = "FileType",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
