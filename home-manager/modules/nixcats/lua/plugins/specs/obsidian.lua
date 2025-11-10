local nc = rawget(_G, "nixCats") or require("nixCats")

local prefix = "<leader>o"

return {
	{
		"obsidian.nvim",
		enabled = nc("general") or false,
		event = "FileType",
		ft = { "markdown" },

		keys = {
			{ prefix, "<Nop>", desc = "obsidian" },
			{ prefix .. "o", "<cmd>Obsidian open<CR>", desc = "Open on App" },
			{ prefix .. "g", "<cmd>Obsidian search<CR>", desc = "Grep" },
			{ prefix .. "n", "<cmd>Obsidian new<CR>", desc = "New Note" },
			{ prefix .. "N", "<cmd>Obsidian new_from_template<CR>", desc = "New Note (Template)" },
			{ prefix .. "<space>", "<cmd>Obsidian quick_switch<CR>", desc = "Find Files" },
			{ prefix .. "b", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
			{ prefix .. "t", "<cmd>Obsidian tags<CR>", desc = "Tags" },
			{ prefix .. "T", "<cmd>Obsidian template<CR>", desc = "Template" },
			{ prefix .. "L", "<cmd>Obsidian link<CR>", mode = "v", desc = "Link" },
			{ prefix .. "l", "<cmd>Obsidian links<CR>", desc = "Links" },
			{ prefix .. "l", "<cmd>Obsidian link_new<CR>", mode = "v", desc = "New Link" },
			{ prefix .. "e", "<cmd>Obsidian extract_note<CR>", mode = "v", desc = "Extract Note" },
			{ prefix .. "w", "<cmd>Obsidian workspace<CR>", desc = "Workspace" },
			{ prefix .. "r", "<cmd>Obsidian rename<CR>", desc = "Rename" },
			{ prefix .. "i", "<cmd>Obsidian paste_img<CR>", desc = "Paste Image" },
			{ prefix .. "p", "<cmd>MarkdownPreview<CR>", desc = "Preview File" },
		},

		after = function()
			require("obsidian").setup({
				legacy_commands = false,

				workspaces = {
					{ name = "notes", path = "/mnt/Storage/Documents/notes/" },
				},

				callbacks = {
					enter_note = function(note)
						local api = require("obsidian.api")

						vim.keymap.set("n", "<leader>ch", function()
							require("obsidian.api").toggle_checkbox()
						end, { buffer = note.bufnr, desc = "Toggle checkbox" })

						-- link navigation
						vim.keymap.set("n", "<leader>on", function()
							api.nav_link("next")
						end, {
							buffer = note.bufnr,
							desc = "Next link",
						})
						vim.keymap.set("n", "<leader>oN", function()
							api.nav_link("prev")
						end, {
							buffer = note.bufnr,
							desc = "Previous link",
						})
					end,
				},

				notes_subdir = "000 Index",
				new_notes_location = "notes_subdir",

				-- Let the plugin auto-detect blink.cmp / nvim-cmp; no need to set defaults.

				ui = {
					enable = false, -- keep this explicit since the default is true
				},

				frontmatter = {
					enabled = true, -- replaces deprecated `disable_frontmatter`
					func = require("obsidian.builtin").frontmatter, -- modern location
					order = { "id", "aliases", "tags", "references", "links" }, -- key is `order` now
				},

				note_id_func = function(title)
					return title
				end,
				note_path_func = function(spec)
					return spec.dir / (spec.title .. ".md")
				end,

				picker = {
					-- In this fork the enum name is "snacks.pick"
					name = "snacks.pick",
					note_mappings = { new = "<C-x>", insert_link = "<C-l>" },
					tag_mappings = { tag_note = "<C-x>", insert_tag = "<C-l>" },
				},

				templates = {
					-- key is `folder` in this fork (not `subdir`)
					folder = "000 Index/001 Templates/",
					date_format = "%Y-%m-%d",
					time_format = "%H:%M",
				},

				attachments = {
					img_folder = "999 Images/",
					-- signature is `function(path)` (no `client`)
					img_text_func = function(path)
						return string.format("![[%s]]", path.name)
					end,
				},

				checkbox = {
					enabled = true,
					create_new = true,
					order = { " ", "x", "!", ">", "~" },
				},

				sort_by = "modified",
				sort_reversed = true,
			})
		end,
	},
}
