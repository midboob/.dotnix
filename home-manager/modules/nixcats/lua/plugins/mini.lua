return {
		"nvim-mini/mini.nvim",
		enabled = true,
    version = false,
		config = function()
			require("mini.pairs").setup()
			require("mini.icons").setup()
			require("mini.ai").setup()
			require("mini.surround").setup()
		end,
}
