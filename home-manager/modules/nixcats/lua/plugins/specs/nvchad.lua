return {
	{
		"nvchad-ui",
		lazy = false,
		config = function()
			-- this is the main entry point provided by NvChad/ui
			local ok, err = pcall(require, "nvchad")
			if not ok then
				vim.notify("NvChad UI failed to load: " .. tostring(err), vim.log.levels.ERROR)
			end
		end,
	},
	{
		"base46",
		lazy = true,
		config = function()
			-- compile + load all highlights
			local ok, base46 = pcall(require, "base46")
			if ok then
				base46.load_all_highlights()
			else
				vim.notify("base46 not found", vim.log.levels.ERROR)
			end
		end,
	},
}
