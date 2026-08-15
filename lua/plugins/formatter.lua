return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "alejandra" },
      yaml = { "biome" },
      toml = { "biome" },
      json = { "biome" },
      jsonc = { "biome" },
      css = { "biome" },
      typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
      javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true }, -- Biome is not working on this
      markdown = { "prettierd", "prettier", stop_after_first = true }, -- No support for Biome
      ["mdx"] = { "prettierd", "prettier", stop_after_first = true }, -- No support for Biome
      typst = { "typstyle" },
    },
  },
}
