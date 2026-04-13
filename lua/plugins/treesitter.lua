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
    event = "VeryLazy",
    opts = {
      move = { set_jumps = true },
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        include_surrounding_whitespace = true,
      },
    },
    keys = {
      {
        "am",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end,
        desc = "TS: Select function outer",
        mode = { "x", "o" },
      },
      {
        "im",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end,
        desc = "TS: Select function inner textobject",
        mode = { "x", "o" },
      },
      {
        "ac",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
        end,
        desc = "TS: Select class outer textobject",
        mode = { "x", "o" },
      },
      {
        "ic",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
        end,
        desc = "TS: Select class inner textobject",
        mode = { "x", "o" },
      },
      {
        "as",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
        end,
        desc = "TS: Select local scope",
        mode = { "x", "o" },
      },
      {
        "]m",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
        desc = "TS: Next function start",
        mode = { "n", "x", "o" },
      },
      {
        "[m",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
        desc = "TS: Previous function start",
        mode = { "n", "x", "o" },
      },
      {
        "]M",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
        end,
        desc = "TS: Next function end",
        mode = { "n", "x", "o" },
      },
      {
        "[M",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
        end,
        desc = "TS: Previous function end",
        mode = { "n", "x", "o" },
      },
      {
        "]o",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
        end,
        desc = "TS: Next loop start",
        mode = { "n", "x", "o" },
      },
      {
        "]s",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
        end,
        desc = "TS: Next local scope",
        mode = { "n", "x", "o" },
      },
      {
        "]z",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
        end,
        desc = "TS: Next fold start",
        mode = { "n", "x", "o" },
      },
      {
        "<leader>x",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
        end,
        desc = "TS: Swap next parameter",
        mode = "n",
      },
      {
        "<leader>X",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
        end,
        desc = "TS: Swap previous parameter",
        mode = "n",
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
