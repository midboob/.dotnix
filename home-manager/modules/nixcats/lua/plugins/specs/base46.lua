local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"base46",
		enabled = nc("general") or false,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
}
