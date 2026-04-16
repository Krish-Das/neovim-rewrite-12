-- Set default colorscheme
vim.cmd.colorscheme("dracula")

-- Auto-command to switch colorscheme for markdown files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.md", "*.mdx" },
  callback = function()
    vim.cmd.colorscheme("github_dark")
  end,
})

-- Switch back when leaving markdown files
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = { "*.md", "*.mdx" },
  callback = function()
    vim.cmd.colorscheme("dracula")
  end,
})
