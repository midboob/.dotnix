local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"bullet.nvim",
		enabled = nc("general") or false,
		event = "FileType",
		ft = {"markdown", "text", "scratch", "gitcommit"},
		after = function()
		end,
	},
}
