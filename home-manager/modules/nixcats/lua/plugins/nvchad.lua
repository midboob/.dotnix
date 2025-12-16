return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvchad/base46",
    lazy = false,        -- load at startup
    priority = 1000,     -- make sure it runs before most UI stuff
    config = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvchad/ui",
    lazy = false,        -- UI available immediately
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvchad/base46",
    },
    config = function()
      require("nvchad")
    end,
  },
}
