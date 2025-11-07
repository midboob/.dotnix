local nc = rawget(_G, "nixCats") or require("nixCats")

return {
	{
		"snacks.nvim",
		enabled = nc("general") or false,
		event = "DeferredUIEnter",
		after = function()
			local Snacks = require("snacks")
			Snacks.setup({
				animate = { enabled = true },
				dashboard = {
					enabled = true,
					preset = {
						header = [[
																														                       
											████ ██████           █████      ██                    
										 ███████████             █████                            
										 █████████ ███████████████████ ███   ███████████  
										█████████  ███    █████████████ █████ ██████████████  
									 █████████ ██████████ █████████ █████ █████ ████ █████  
								 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
								██████  █████████████████████ ████ █████ █████ ████ ██████
						]],
					},
				},
				explorer = { enabled = false },
				picker = {},
				bigfile = {},
				image = {
					enabled = true,
					resolve = function(file, src)
						-- Clean link from "image\" to "image"
						local clean_src = src:match("^(.-)\\") or src

						-- List of possible image directories (across different machines or vaults)
						local image_dirs = {
							vim.fn.expand("~/Documents/notes/999 Images"), -- Path on Computer A
							vim.fn.expand("/mnt/Storage/Documents/notes/999 Images/"), -- Path on Computer B (adjust this)
						}

						-- Try each directory in order
						for _, dir in ipairs(image_dirs) do
							local full_path = vim.fn.fnamemodify(dir .. "/" .. clean_src, ":p")
							if vim.fn.filereadable(full_path) == 1 then
								return full_path
							end
						end

						-- Fallback: resolve relative to current file
						local fallback_path = vim.fn.fnamemodify(file:match("(.*/)") .. clean_src, ":p")
						return fallback_path
					end,
					doc = {
						enable = true,
						inline = true,
						float = false,
						max_width = 80,
						max_height = 40,
					},
					math = {
						enabled = true,
						typst = {
							tpl = [[
        #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
        #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
        #set text(size: 12pt, fill: rgb("${color}"))
        ${header}
        ${content}]],
						},
						latex = {
							font_size = "Large", -- see https://www.sascha-frank.com/latex-font-size.html
							-- for latex documents, the doc packages are included automatically,
							-- but you can add more packages here. Useful for markdown documents.
							packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools" },
							tpl = [[
        \documentclass[preview,border=0pt,varwidth,12pt]{standalone}
        \usepackage{${packages}}
        \begin{document}
        ${header}
        { \${font_size} \selectfont
          \color[HTML]{${color}}
        ${content}}
        \end{document}]],
						},
					},
				},
				lazygit = {},
				terminal = {},
				rename = {},
				notifier = {},
				indent = {},
				gitbrowse = {},
				scope = {},
				toggle = { enabled = true },
			})
			-- Keymaps for Snacks features
			vim.keymap.set("n", "<leader>e", function()
				Snacks.explorer.open()
			end, { desc = "Snacks Explorer" })
			vim.keymap.set("n", "<C-\\>", function()
				Snacks.terminal.open()
			end, { desc = "Snacks Terminal" })
			vim.keymap.set("n", "<leader>_", function()
				Snacks.lazygit.open()
			end, { desc = "Snacks LazyGit" })
			vim.keymap.set("n", "<leader>sf", function()
				Snacks.picker.smart()
			end, { desc = "Smart Find Files" })
			vim.keymap.set("n", "<leader><leader>s", function()
				Snacks.picker.buffers()
			end, { desc = "Search Buffers" })
			vim.keymap.set("n", "<leader>ff", function()
				Snacks.picker.files()
			end, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", function()
				Snacks.picker.git_files()
			end, { desc = "Find Git Files" })
			vim.keymap.set("n", "<leader>sb", function()
				Snacks.picker.lines()
			end, { desc = "Buffer Lines" })
			vim.keymap.set("n", "<leader>sB", function()
				Snacks.picker.grep_buffers()
			end, { desc = "Grep Open Buffers" })
			vim.keymap.set("n", "<leader>sg", function()
				Snacks.picker.grep()
			end, { desc = "Grep" })
			vim.keymap.set({ "n", "x" }, "<leader>sw", function()
				Snacks.picker.grep_word()
			end, { desc = "Grep Word/Visual" })
			vim.keymap.set("n", "<leader>sd", function()
				Snacks.picker.diagnostics()
			end, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>sD", function()
				Snacks.picker.diagnostics_buffer()
			end, { desc = "Buffer Diagnostics" })
			vim.keymap.set("n", "<leader>sh", function()
				Snacks.picker.help()
			end, { desc = "Help Pages" })
			vim.keymap.set("n", "<leader>sj", function()
				Snacks.picker.jumps()
			end, { desc = "Jumps" })
			vim.keymap.set("n", "<leader>sk", function()
				Snacks.picker.keymaps()
			end, { desc = "Keymaps" })
			vim.keymap.set("n", "<leader>sl", function()
				Snacks.picker.loclist()
			end, { desc = "Location List" })
			vim.keymap.set("n", "<leader>sm", function()
				Snacks.picker.marks()
			end, { desc = "Marks" })
			vim.keymap.set("n", "<leader>sM", function()
				Snacks.picker.man()
			end, { desc = "Man Pages" })
			vim.keymap.set("n", "<leader>sq", function()
				Snacks.picker.qflist()
			end, { desc = "Quickfix List" })
			vim.keymap.set("n", "<leader>sR", function()
				Snacks.picker.resume()
			end, { desc = "Resume" })
			vim.keymap.set("n", "<leader>su", function()
				Snacks.picker.undo()
			end, { desc = "Undo History" })
		end,
	},
}
