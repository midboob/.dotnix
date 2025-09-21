return {
  "neovim/nvim-lspconfig",
  opts = {
    cmd = { "qmlls", "-E" },
    diagnostics = {
      virtual_text = {
        float = {
          border = {
            { "┌", "FloatBorder" },
            { "─", "FloatBorder" },
            { "┐", "FloatBorder" },
            { "│", "FloatBorder" },
            { "┘", "FloatBorder" },
            { "─", "FloatBorder" },
            { "└", "FloatBorder" },
            { "│", "FloatBorder" },
          },
        },
      },
    },
    inlay_hints = {
      enabled = nvim_0_10,
    },
    codelens = {
      enabled = false,
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            hint = {
              enable = nvim_0_10,
              setType = nvim_0_10,
            },
          },
        },
      },
      tinymist = {
        settings = {
          formatterMode = "typstyle",
          exportPdf = "onType",
          semanticTokens = "disable",
          outputPath = "$dir/$name",
        },
      },
    },
  },
}
