local theme = require("config.theme")

local spec = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    colorscheme = "catppuccin-macchiato",
    opts = { no_italic = true },
  },
  { "dracula/vim", name = "dracula" },
  {
    "khoido2003/monokai-v2.nvim",
    name = "monokai-v2",
    opts = {
      filter = "spectrum",
    },
    init = function()
      -- require("lualine").setup({ options = { theme = "monokai-v2" } })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    opts = {
      dim_inactive_windows = true,
      extend_background_behind_borders = false,
      variant = "main",
      styles = { transparency = false, italic = false },
    },
  },
  { "olimorris/onedarkpro.nvim", name = "onedark" },
  { "folke/tokyonight.nvim", name = "tokyonight", enabled = false },
  { "marko-cerovac/material.nvim", name = "material", enabled = false },
  {
    "nickkadutskyi/jb.nvim",
    opts = { disable_hl_args = { italic = true } },
    enabled = false,
  },
}

return theme.activate(spec, "catppuccin")
