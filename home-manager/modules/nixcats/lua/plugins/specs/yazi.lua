local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	"yazi.nvim",
	enabled = nc("general") or false,
	event = "DeferredUIEnter",
	keys = {
		{
			"<leader>e",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at current file",
		},
		{
			"<leader>E",
			"<cmd>Yazi cwd<cr>",
			desc = "Open yazi at nvim's cwd",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
