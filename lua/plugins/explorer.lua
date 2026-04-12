---@diagnostic disable: unused-local
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- enable 24-bit color
vim.opt.termguicolors = true

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
  lazy = false,
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
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    window = {
      position = "right",
    },
    filesystem = {
      filtered_items = {
        hide_by_name = { "node_modules" },
        always_show_by_pattern = { ".env*" },
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = "A",
          modified = "M", -- 
          deleted = "D", -- ⨯
          renamed = "R", -- 󰁕
          -- Status type
          untracked = "?",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
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
}

local nvim_tree = {
  "nvim-tree/nvim-tree.lua",
  keys = {
    {
      "<leader>e",
      function()
        require("nvim-tree.api").tree.toggle()
      end,
      desc = "Toggle nvim tree",
    },
  },
  opts = {
    hijack_cursor = true,
    disable_netrw = true,
    sort = { sorter = "case_sensitive" },
    view = {
      width = 40,
      side = "right",
      centralize_selection = true,
    },
    renderer = {
      group_empty = true,
      indent_markers = { enable = true },
      add_trailing = true,
      -- root_folder_label = ":t", -- just the root folder
      root_folder_label = ":t:s?^?􁋷  ?", -- root folder with icon
      icons = {
        show = {
          file = false,
          folder = false,
          folder_arrow = false,
          git = false,
        },
      },
    },
    filters = { dotfiles = true },
    git = { enable = true },
    diagnostics = {
      enable = true,
      icons = { hint = "h", info = "i", warning = "W", error = "E" },
    },
  },
}

return { oil, neo_tree }
