return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "saghen/blink.cmp",
  },

  config = function()
    -- =========================
    -- Capabilities (blink.cmp)
    -- =========================
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local ok, blink = pcall(require, "blink.cmp")
    if ok and blink.get_lsp_capabilities then
      capabilities = blink.get_lsp_capabilities(capabilities)
    end

    -- =========================
    -- on_attach (keymaps)
    -- =========================
    local on_attach = function(_, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {
          buffer = bufnr,
          silent = true,
          desc = desc,
        })
      end

      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      map("n", "gr", vim.lsp.buf.references, "References")
      map("n", "K", vim.lsp.buf.hover, "Hover documentation")

      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

      map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, "Format buffer")
    end

    -- =========================
    -- Diagnostics UI
    -- =========================
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- =========================
    -- LSP servers (NEW API)
    -- =========================

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config("pyright", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
      },
    })

    vim.lsp.config("bashls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("nil_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ["nil"] = {
          formatting = {
            command = { "nixpkgs-fmt" },
          },
        },
      },
    })

    vim.lsp.config("tinymist", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        exportPdf = "onSave",
      },
    })

    vim.lsp.config("texlab", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        texlab = {
          build = { onSave = false },
          forwardSearch = {
            executable = "zathura",
            args = {
              "--synctex-forward",
              "%l:1:%f",
              "%p",
            },
          },
        },
      },
    })
  end,
}
