local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"blink.cmp",
		enabled = nc("general") or false,
		event = "DeferredUIEnter",
		on_require = "blink",
		after = function()
			require("blink.cmp").setup({
				keymap = { preset = "super-tab" },
				appearance = { nerd_font_variant = "mono" },
				signature = { enabled = true },
				sources = { default = { "lsp", "path", "snippets", "buffer" } },
			})
		end,
	},
}
