local disabled = {
  {
    "akinsho/bufferline.nvim",
  },
}

for i, plugin in ipairs(disabled) do
  plugin.enabled = false
end

return disabled
