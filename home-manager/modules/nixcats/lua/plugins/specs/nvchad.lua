return {
	{
		"nvim-web-devicons",
		lazy = true,
	},

	{
		"nvchad-ui",
		lazy = false,
		after = function()
			require("nvchad")
		end,
	},

	{
		"base46",
		lazy = true,
		after = function()
			require("base46").load_all_highlights()
		end,
	},
}
