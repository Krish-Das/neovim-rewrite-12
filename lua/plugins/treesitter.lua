return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "BufReadPost",
  build = ":TSUpdate",
  branch = "main", -- main branch requires `tree-sitter` binary in path

  -- Better typescript/tsx comments
  dependencies = {
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },

  -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
  config = function()
    -- ensure basic parser are installed
    local parsers = {
      "bash",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
      "json",
      "typescript",
      "javascript",
      "tsx",
      "css",
      "nix",
    }
    local auto_install_parsers = true
    require("nvim-treesitter").install(parsers)

    -- Neovim ≥0.12 provides built-in Treesitter-based selection (`v + an/in`).
    -- However, MiniAi overrides the default `an`/`in` textobjects, so the
    -- fallback LSP-based selection (`vim.lsp.buf.selection_range`) becomes
    -- inaccessible.
    -- These mappings restore incremental selection using LSP ranges.
    --
    -- See:
    --   :h treesitter-defaults
    --   :h vim.lsp.buf.selection_range()
    local map_lsp_selection = function(lhs, desc)
      local s = vim.startswith(desc, "Increase") and 1 or -1
      local rhs = function()
        vim.lsp.buf.selection_range(s * vim.v.count1)
      end
      vim.keymap.set("x", lhs, rhs, { desc = desc })
    end
    map_lsp_selection("<CR>", "Increase selection")
    map_lsp_selection("<BS>", "Decrease selection")

    ---@param buf integer
    ---@param language string
    local function treesitter_try_attach(buf, language)
      -- check if parser exists and load it
      if not vim.treesitter.language.add(language) then
        return
      end
      -- enables syntax highlighting and other treesitter features
      vim.treesitter.start(buf, language)

      -- enables treesitter based folds
      -- for more info on folds see `:help folds`
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldmethod = "expr"

      -- check if treesitter indentation is available for this language, and if so enable it
      -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
      local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil

      -- enables treesitter based indentation
      if has_indent_query then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    local available_parsers = require("nvim-treesitter").get_available()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        local installed_parsers = require("nvim-treesitter").get_installed("parsers")

        if vim.tbl_contains(installed_parsers, language) then
          -- enable the parser if it is installed
          treesitter_try_attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) and auto_install_parsers then
          -- auto-install and enable parsers
          require("nvim-treesitter").install(language):await(function()
            treesitter_try_attach(buf, language)
          end)
        else
          -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
          treesitter_try_attach(buf, language)
        end
      end,
    })

    -- Enable better typescript-react comment
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
