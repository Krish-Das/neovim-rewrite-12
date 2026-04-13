return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = "VeryLazy",
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
    lazy = false,
    priority = 1000,
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
    lazy = "VeryLazy",
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
}
