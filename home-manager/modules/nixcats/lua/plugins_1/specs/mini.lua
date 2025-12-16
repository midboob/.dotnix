local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"mini.nvim",
		enabled = nc("general") or false,
		event = "DeferredUIEnter",
		after = function()
			require("mini.pairs").setup()
			require("mini.icons").setup()
			require("mini.ai").setup()
			require("mini.surround").setup()
		end,
	}
}
