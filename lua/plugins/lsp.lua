return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "mason-org/mason.nvim",
      ---@module 'mason.settings'
      ---@type MasonSettings
      ---@diagnostic disable-next-line: missing-fields
      opts = {},
    },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Eye candy
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local map = require("config.keymap_utils")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        map("grn", vim.lsp.buf.rename, "LSP: Rename")
        map("g.", vim.lsp.buf.code_action, "LSP: Code Action", { "n", "x" })
        map("grD", vim.lsp.buf.declaration, "LSP: Goto Declaration")
        map("gd", vim.lsp.buf.definition, "LSP: Goto Declaration")
        map("gh", vim.lsp.buf.hover, "LSP: Trigger hover")

        -- Highlight word occurrences under cursor
        -- From Kickstart nvim https://github.com/nvim-lua/kickstart.nvim/blob/648471c9eb1f757729e800ff0a6509e01232a8e9/init.lua#L534
        --
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/documentHighlight", event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
            end,
          })
        end

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
        end, "LSP: Toggle Diagnostics")

        -- Toggle inlay hints
        if client and client:supports_method("textDocument/inlayHint", event.buf) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "LSP: Toggle Inlay Hints")
        end
      end,
    })

    -- Language servers (passed to vim.lsp.config / vim.lsp.enable)
    ---@type table<string, vim.lsp.Config>
    local servers = {
      bashls = {},
      biome = {},
      cssls = {},
      html = {},
      jsonls = {},
      tailwindcss = {},
      ts_ls = {},
      vimls = {},
      tinymist = {},

      -- Special Lua Config, as recommended by neovim help docs
      lua_ls = {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
              path ~= vim.fn.stdpath("config")
              and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              version = "LuaJIT",
              path = { "lua/?.lua", "lua/?/init.lua" },
            },
            workspace = {
              checkThirdParty = false,
              library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
                "${3rd}/luv/library",
                "${3rd}/busted/library",
              }),
            },
          })
        end,
        settings = { Lua = {} },
      },
    }

    -- Formatters / linters installed via Mason, but not started as LSP servers.
    -- mypy/pyright/ruff need `python3` on PATH for Mason's pip installer.
    local tools = {
      "prettierd",
      "shellcheck",
      "shfmt",
      "stylua",
      "typstyle",
      -- "luacheck", -- requires "luarocks" executable in PATH.
      -- "alejandra", -- requires "alejandra" executable in PATH.
    }

    local ensure_installed = vim.list_extend(vim.tbl_keys(servers), tools)
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    for name, server in pairs(servers) do
      vim.lsp.config(name, server)
      vim.lsp.enable(name)
    end

    -- Use nixd binary from system PATH
    -- nixd needs to be installed in system PATH
    vim.lsp.config("nixd", { cmd = { "nixd" } })
    vim.lsp.enable("nixd")
  end,
}
