local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"base16-nvim",
		enabled = nc("general") or false,
    event = "DeferredUIEnter",
	},
}
