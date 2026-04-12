-- List of command pairs (uppercase -> lowercase)
local commands = {
  ["W"] = "w",
  ["Wq"] = "wq",
  ["WQ"] = "wq",
  ["Wa"] = "wa",
  ["WA"] = "wa",
  ["Wqa"] = "wqa",
  ["WQa"] = "wqa",
  ["WQA"] = "wqa",
  ["Bd"] = "bd",
  ["Bda"] = "bda",
}

-- Create command aliases
for uppercase, lowercase in pairs(commands) do
  vim.api.nvim_create_user_command(uppercase, lowercase, {
    desc = string.format("Command alias for :%s", lowercase),
  })
end

-- Highlight yank
-- See `:help vim.highlight.on_yank()`
--
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.hl.on_yank({ timeout = 200, visual = true })
  end,
})

-- auto resize splits when the terminal's window is resized
--
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

-- no auto continue comments on new line
--
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_auto_comment", {}),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- ide like highlight when stopping cursor
--
vim.api.nvim_create_autocmd("CursorMoved", {
  group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
  desc = "Highlight references under cursor",
  callback = function()
    -- Only run if the cursor is not in insert mode
    if vim.fn.mode() ~= "i" then
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      local supports_highlight = false
      for _, client in ipairs(clients) do
        if client.server_capabilities.documentHighlightProvider then
          supports_highlight = true
          break -- Found a supporting client, no need to check others
        end
      end

      -- 3. Proceed only if an LSP is active AND supports the feature
      if supports_highlight then
        vim.lsp.buf.clear_references()
        vim.lsp.buf.document_highlight()
      end
    end
  end,
})

-- ide like highlight when stopping cursor
--
vim.api.nvim_create_autocmd("CursorMovedI", {
  group = "LspReferenceHighlight",
  desc = "Clear highlights when entering insert mode",
  callback = function()
    vim.lsp.buf.clear_references()
  end,
})

-- Vertical Help
--
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
  pattern = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd.wincmd("L")
      vim.cmd.wincmd("=")
    end
  end,
})

-- Make the colorscheme background transparent
--
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   group = vim.api.nvim_create_augroup("UserColorschemeOverrides", { clear = true }),
--   pattern = "*",
--   callback = function()
--     vim.cmd.highlight("statusline guibg=NONE")
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--     vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
--   end,
--   desc = "Make colorscheme background transparent",
-- })
