return {
	{
		"nvim-web-devicons",
	},

	{
		"nvchad-ui",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},

	{
		"base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
}
