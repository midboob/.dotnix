return {
	"lervag/vimtex",
	enabled = true,
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_general_viewer = "zathura"
		vim.g.vimtex_view_general_options = "--synctex-forward @line:@col:@tex --unique file:@pdf"
		vim.g.vimtex_compiler_continuous = 1
	end,
}
