local oil = {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = false,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, _)
        return vim.startswith(name, ".") or name == "node_modules"
      end,
    },
  },
  keys = {
    {
      "<leader>o",
      function()
        local oil = require("oil")
        if vim.bo.filetype == "oil" then
          oil.close()
        else
          oil.open()
        end
      end,
      desc = "Toggle Oil",
    },
  },
}

local neo_tree = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    window = { position = "left" },
    enable_git_status = false,
    filesystem = {
      hijack_netrw_behavior = "disabled",
      filtered_items = {
        hide_by_name = { "node_modules" },
        always_show_by_pattern = { ".env*" },
      },
      follow_current_file = { enabled = true },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = "A",
          modified = "M", -- 
          deleted = "D", -- ⨯
          renamed = "R",
          -- Status type
          untracked = "?",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "⨯",
        },
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Toggle neotree file explorer",
    },
  },
  init = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- enable 24-bit color
    vim.opt.termguicolors = true
  end,
}

return { oil, neo_tree }
