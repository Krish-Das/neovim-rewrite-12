-- Quality of life improvement plugins

return {
  { "kylechui/nvim-surround", version = "^4.0.0", event = "VeryLazy" },
  { "nvim-mini/mini.ai", opts = {}, event = { "BufReadPost", "BufNewFile" } },
  { "tommcdo/vim-exchange", keys = { "cx", "X" } },
  { "stevearc/dressing.nvim", event = "VeryLazy", opts = {} },

  -- Virt column
  {
    "lukas-reineke/virt-column.nvim",
    event = "BufEnter",
    opts = {
      char = { "│" },
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

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()
      local set = vim.keymap.set
        -- stylua: ignore start
        -- Add or skip adding a new cursor by matching word/selection
        set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end)
        set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end)
        set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end)
        set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end)

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)

            -- Select a different cursor as the main one.
            layerSet({"n", "x"}, "<left>", mc.prevCursor)
            layerSet({"n", "x"}, "<right>", mc.nextCursor)

            -- Delete the main cursor.
            layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)

        -- Customize how cursors look.
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn"})
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
      -- stylua: ignore end
    end,
  },
}
