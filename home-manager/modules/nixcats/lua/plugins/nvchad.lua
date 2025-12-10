return {
  "nvchad/ui",
  lazy = false, -- load at startup; you put it in startupPlugins anyway
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
      "nvchad/base46",
      lazy = true,
      build = function()
        -- compile highlight cache
        pcall(function()
          require("base46").load_all_highlights()
        end)
      end,
    },
  },
  config = function()
    -- this expects lua/chadrc.lua to exist and return the NvConfig table
    require("nvchad")
  end,
}
