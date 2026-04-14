return {
  -- Mini.nvim
  -- { "nvim-mini/mini.surround", opts = {}, keys = { "sa", "sd", "sr", "sf" } },
  { "kylechui/nvim-surround", version = "^4.0.0", event = "VeryLazy" },
  { "nvim-mini/mini.ai", opts = {}, event = { "BufReadPost", "BufNewFile" } },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Indentline
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "BufEnter",
    opts = {
      draw = {
        delay = 250,
      },
      symbol = "│", -- ┃
    },
  },

  -- Virt column
  {
    "lukas-reineke/virt-column.nvim",
    event = "BufEnter",
    opts = {
      char = { "│" }, -- | │ ┃
      virtcolumn = "80",
      highlight = { "Whitespace" }, -- NonText Whitespace
    },
  },

  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    ft = { "typescriptreact", "javascriptreact", "html" },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true, -- Auto close on trailing </
      },
      per_filetype = {
        ["html"] = { enable_close = false },
      },
    },
  },

  -- Leap jump
  {
    "https://codeberg.org/andyg/leap.nvim.git",
    name = "leap",
    keys = {
      { "s", "<Plug>(leap-forward)", desc = "Leap: Forward to", mode = { "n", "x", "o" } },
      { "<A-s>", "<Plug>(leap-backward)", desc = "Leap: Backward to", mode = { "n", "x", "o" } },
      { "x", "<Plug>(leap-forward-till)", desc = "Leap: Forward till", mode = { "x", "o" } },
      { "X", "<Plug>(leap-backward-till)", desc = "Leap: Backward till", mode = { "x", "o" } },
      { "gs", "<Plug>(leap-from-window)", desc = "Leap: to non-current buffer", mode = { "n", "x", "o" } },
    },
  },

  -- Fold plugin
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {
      foldtext = {
        lineCount = { template = " %d" },
      },
      autoFold = { enabled = false },
      foldKeymaps = { setup = false },
    },
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
  },

  -- Startup time
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      -- Configuration for plugins that don't force you to call a `setup` function
      -- for initialization should typically go in a `before`
      --- or `beforeAll` function.
      vim.g.startuptime_tries = 10
    end,
  },

  -- Zen mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = { window = { width = 0.75, options = {
      signcolumn = "no",
      number = false,
    } } },
  },
}
