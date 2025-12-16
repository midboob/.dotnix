local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"fidget.nvim",
		enabled = nc("general") or false,
		event = "DeferredUIEnter",
	},
}
