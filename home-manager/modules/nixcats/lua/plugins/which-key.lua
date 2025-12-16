return {
  "folke/which-key.nvim"
    enabled = true,
		config = function()
			local wk = require("which-key")
			wk.setup({
				preset = "helix",
        win = {
          title = false,
          padding = { 1, 2 },
        },
        spelling = {
          enabled = true,
        }
			})
			wk.add({
				{ "<leader><leader>", group = "buffer" },
				{ "<leader>c", group = "[c]ode" },
				{ "<leader>d", group = "[d]ocument" },
				{ "<leader>g", group = "[g]it" },
				{ "<leader>r", group = "[r]ename" },
				{ "<leader>f", group = "[f]ind" },
				{ "<leader>s", group = "[s]earch" },
				{ "<leader>t", group = "[t]oggles" },
				{ "<leader>w", group = "[w]orkspace" },
			})
		end,


}

