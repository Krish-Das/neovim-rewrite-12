local event = { "BufReadPre", "BufNewFile" }
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = event,
    init = function()
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    end,
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    opts = {
      ensure_installed = {
        "diff",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "json",
        "jsonc",
        "typescript",
        "javascript",
        "tsx",
        "css",
        "html",
        "bash",
        "nix",
        "vim",
        "vimdoc",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        --
        -- disable slow treesitter highlight for large files
        -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#modules
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      -- Treesitter indent is inconsistent for a number of languages and can
      -- force new lines back to column 0. Let filetype indent + autoindent
      -- handle indentation instead.
      indent = { enable = false },
      auto_install = false,
      sync_install = false,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "grc",
          node_decremental = "<BS>",
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = event,
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- MDX syntax highlighting with Treesitter
  {
    "davidmh/mdx.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "mdx",
    init = function()
      vim.filetype.add({
        extension = { mdx = "mdx" },
      })
    end,
  },
}
