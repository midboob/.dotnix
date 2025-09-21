return {
  "chomosuke/typst-preview.nvim",
  lazy = true,
  ft = "typst",
  version = "1.*",
  opts = {
    follow_cursor = true,
    port = 1234,
  }, -- lazy.nvim will implicitly calls `setup {}`
}
