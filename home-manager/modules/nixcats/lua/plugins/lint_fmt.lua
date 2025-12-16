return {
  {
    "mfussenegger/nvim-lint",
    enabled = nc("general") or false,
    event = "FileType",
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        go = nc("go") and { "golangcilint" } or {},
      }

      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    enabled = nc("general") or false,
    event = "BufReadPre",
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = nc("lua") and { "stylua" } or {},
          go = nc("go") and { "gofmt" } or {},
          nix = nc("nix") and { "alejandra" } or {},
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>FF", function()
        conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
      end, { desc = "[F]ormat [F]ile" })
    end,
  },
}
