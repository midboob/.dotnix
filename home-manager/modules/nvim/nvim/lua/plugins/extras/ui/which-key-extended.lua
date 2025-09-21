return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.icons = {
      rules = {
        { pattern = "obsidian", icon = "", color = "purple" },
        { pattern = "backlink", icon = "", color = "purple" },
        { pattern = "image", icon = "", color = "purple" },
        { pattern = "link", icon = "", color = "purple" },
        { pattern = "note", icon = "󰈔", color = "purple" },
        { pattern = "tags", icon = "", color = "purple" },
        { pattern = "rename", icon = "󰑕", color = "purple" },
      },
    }
  end,
}
