local nc = rawget(_G, "nixCats") or require("nixCats")

-- Component: show Conform/LSP formatter status
local function formatter_component()
  local ok, conform = pcall(require, "conform")
  if not ok then return "" end

  local lsp_format = require("conform.lsp_format")

  -- Conform formatters for current buffer
  local formatters = conform.list_formatters_for_buffer()
  if formatters and #formatters > 0 then
    return "󰷈 " .. table.concat(formatters, " ")
  end

  -- LSP formatter clients
  local bufnr = vim.api.nvim_get_current_buf()
  local lsp_clients = lsp_format.get_format_clients({ bufnr = bufnr })
  if lsp_clients and not vim.tbl_isempty(lsp_clients) then
    return "󰷈 LSP Formatter"
  end

  -- Return nil so lualine hides the component when empty
  return ""
end

return {
  -- Lualine (statusline)
  -- {
  --   "lualine.nvim",
  --   enabled = nc("general") or false,
  --   event = "DeferredUIEnter",
  --   load = function(name)
  --     vim.cmd.packadd(name)
  --     vim.cmd.packadd("lualine-lsp-progress")
  --   end,
  --   after = function()
  --     require("lualine").setup({
  --       options = {
  --         icons_enabled = true,
  --         theme = "base16",
  --         component_separators = "|",
  --         section_separators = "",
  --       },
  --       sections = {
  --         lualine_c = { { "filename", path = 1, status = true } },
  --         -- 👇 Add the formatter component here (or in any section you prefer)
  --         lualine_x = { formatter_component, "filetype" },
  --       },
  --       inactive_sections = {
  --         lualine_b = { { "filename", path = 3, status = true } },
  --         lualine_x = { "filetype" },
  --       },
  --       tabline = {
  --         lualine_a = { "buffers" },
  --         lualine_b = { "lsp_progress" },
  --         lualine_z = { "tabs" },
  --       },
  --     })
  --   end,
  -- },
  {
    "transparent.nvim",
    enabled = false,
    event = "DeferredUIEnter",
  },
}
