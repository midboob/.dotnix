return {
		"saghen/blink.cmp",
		enabled = true,
    opts = {
				completion = {
					menu = {
						border = "rounded",
					},
					documentation = {
						window = {
							border = "rounded",
						},
					},
				},
				keymap = { preset = "enter" },
				appearance = {
					nerd_font_variant = "mono",
				},
				signature = { enabled = true },
				sources = { default = { "lsp", "path", "snippets", "buffer" } },
			}
}
