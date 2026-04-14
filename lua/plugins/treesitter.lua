local ts_select = function(query, query_group)
  return function()
    require("nvim-treesitter-textobjects.select").select_textobject(query, query_group or "textobjects")
  end
end

local ts_move = function(dir, query, query_group)
  -- dir: "next_start" | "next_end" | "previous_start" | "previous_end"
  return function()
    require("nvim-treesitter-textobjects.move")["goto_" .. dir](query, query_group or "textobjects")
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = "BufReadPost",
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
      -- stylua: ignore start
      { "am", ts_select("@function.outer"),           desc = "TS: Select function outer",        mode = { "x", "o" } },
      { "im", ts_select("@function.inner"),           desc = "TS: Select function inner",        mode = { "x", "o" } },
      { "ac", ts_select("@class.outer"),              desc = "TS: Select class outer",           mode = { "x", "o" } },
      { "ic", ts_select("@class.inner"),              desc = "TS: Select class inner",           mode = { "x", "o" } },
      { "as", ts_select("@local.scope", "locals"),    desc = "TS: Select local scope",           mode = { "x", "o" } },
      { "]m", ts_move("next_start", "@function.outer"),     desc = "TS: Next function start",    mode = { "n", "x", "o" } },
      { "[m", ts_move("previous_start", "@function.outer"), desc = "TS: Prev function start",    mode = { "n", "x", "o" } },
      { "]M", ts_move("next_end", "@function.outer"),       desc = "TS: Next function end",      mode = { "n", "x", "o" } },
      { "[M", ts_move("previous_end", "@function.outer"),   desc = "TS: Prev function end",      mode = { "n", "x", "o" } },
      { "]o", ts_move("next_start", { "@loop.inner", "@loop.outer" }), desc = "TS: Next loop",   mode = { "n", "x", "o" } },
      { "]s", ts_move("next_start", "@local.scope", "locals"),         desc = "TS: Next scope",  mode = { "n", "x", "o" } },
      { "]z", ts_move("next_start", "@fold", "folds"),                 desc = "TS: Next fold",   mode = { "n", "x", "o" } },
      {
        "<leader>x",
        function() require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner") end,
        desc = "TS: Swap next param", mode = "n",
      },
      {
        "<leader>X",
        function() require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer") end,
        desc = "TS: Swap prev param", mode = "n",
      },
      -- stylua: ignore end
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
