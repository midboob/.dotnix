local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"render-markdown.nvim",
		enabled = nc("general") or false,
		event = "FileType",
		ft = { "markdown" },
		after = function()
			require("render-markdown").setup({
				checkbox = {
					enabled = true,
					custom = {
						todo = {
							raw = "[~]",
							rendered = "󰥔 ",
							highlight = "RenderMarkdownTodo",
							scope_highlight = nil,
						},
						important = {
							raw = "[s]",
							rendered = "󰓎 ",
							highlight = "DiagnosticWarn",
						},
					},
				},
				latex = { enabled = false },
				html = {
					enabled = true,
					comment = {
						conceal = false,
					},
				},
				render_modes = true,
				anti_conceal = {
					enabled = true,
					ignore = {
						code_background = true,
						sign = true,
					},
					above = 0,
					below = 0,
				},
				completions = {
					lsp = { enabled = true },
					blink = { enabled = true },
				},
			})
		end,
	},
}
