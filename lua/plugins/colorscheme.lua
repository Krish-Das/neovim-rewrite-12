local theme = require("config.theme")

local spec = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        identifiers = { "itaclic" },
        functions = { "bold" },
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
        dark_variant = "main",
      },
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    opts = {
      options = {
        transparent = false,
        styles = {
          keywords = "bold",
          types = "italic,bold",
        },
      },
    },
  },
  {
    "ankushbhagats/pastel.nvim",
    opts = {
      style = {
        border = false,
      },
      filetypes = {
        markdown = {
          highlights = function(hl, c)
            hl.Title.bold = true
          end,
        },
      },
    },
    name = "pastel",
    colorscheme = "pastelrose",
  },
}

return theme.activate(spec, "pastel")
