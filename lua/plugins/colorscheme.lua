return {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    contrast = {
      sidebars = true,
      cursor_line = true,
      non_current_windows = false,
    },

    styles = {
      comments = { italic = true },
      conditionals = { italic = true },
      functions = { bold = true },
    },
    plugins = {
      "neo-tree",
    },
    disable = {
      background = false,
    },
    lualine_style = "stealth",
  },
  config = function(_, opts)
    require("material").setup(opts)
    vim.cmd.colorscheme("material-deep-ocean")
  end,
}
