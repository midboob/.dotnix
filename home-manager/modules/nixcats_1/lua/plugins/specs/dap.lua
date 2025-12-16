local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"nvim-dap",
		enabled = nc("general") or false,
		keys = {
			{ "<F5>", desc = "Debug: Start/Continue" },
			{ "<F1>", desc = "Debug: Step Into" },
			{ "<F2>", desc = "Debug: Step Over" },
			{ "<F3>", desc = "Debug: Step Out" },
			{ "<leader>b", desc = "Debug: Toggle Breakpoint" },
			{ "<leader>B", desc = "Debug: Set Breakpoint" },
			{ "<F7>", desc = "Debug: Toggle UI" },
		},
		load = function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("nvim-dap-ui")
			vim.cmd.packadd("nvim-dap-virtual-text")
		end,
		after = function()
			local dap, dapui = require("dap"), require("dapui")
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint: "))
			end, { desc = "Debug: Set Breakpoint" })
			vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: Toggle UI" })

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				show_stop_reason = true,
				commented = false,
				only_first_definition = true,
				all_references = false,
				clear_on_continue = false,
				display_callback = function(variable, _, _, _, opts)
					if opts.virt_text_pos == "inline" then
						return " = " .. variable.value
					end
					return variable.name .. " = " .. variable.value
				end,
				virt_text_pos = (vim.fn.has("nvim-0.10") == 1) and "inline" or "eol",
				all_frames = false,
				virt_lines = false,
				virt_text_win_col = nil,
			})
		end,
	},

	-- Go adapter
	{
		"nvim-dap-go",
		enabled = nc("go") or false,
		on_plugin = { "nvim-dap" },
		after = function()
			require("dap-go").setup()
		end,
	},
}
