local map = require("config.keymap_utils")

-- Disable virtual_text by default
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  signs = true,
  underline = true,
})

-- Toggle virtual text
map("<leader>td", function()
  vim.diagnostic.config({
    virtual_text = not vim.diagnostic.config().virtual_text,
    virtual_lines = false, -- not vim.diagnostic.config().virtual_lines,
    signs = true,
    underline = true,
  })
end, "[T]oggle [D]iagnostics")
