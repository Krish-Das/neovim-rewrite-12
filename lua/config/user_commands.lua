-- Create command aliases
--
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

vim.api.nvim_create_user_command("CopyPath", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, {})

vim.api.nvim_create_user_command("CopyRelPath", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, {})

vim.api.nvim_create_user_command("CopyFileName", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
end, {})

vim.api.nvim_create_user_command("CopyDirPath", function()
  vim.fn.setreg("+", vim.fn.expand("%:p:h"))
end, {})

vim.api.nvim_create_user_command("ToggleDiagnostics", function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end, { desc = "Toggle diagnostics on/off" })

-- Vertical Help
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
--   pattern = "*.txt",
--   callback = function()
--     if vim.bo.buftype == "help" then
--       vim.cmd.wincmd("L")
--       vim.cmd.wincmd("=")
--     end
--   end,
-- })

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
