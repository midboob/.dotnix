return {
  -- nvim-lint: runs on write
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" }, -- makes sense with defaults.lazy = true
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        go = { "golangcilint" },
      }

      local grp = vim.api.nvim_create_augroup("UserLspLint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
        group = grp,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- conform.nvim: formatter with keybinding
  {
    "stevearc/conform.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      {
        "<leader>FF",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end,
        mode = { "n", "v" },
        desc = "[F]ormat [F]ile",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        nix = { "alejandra" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },
}
