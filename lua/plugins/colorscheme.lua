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
}

return theme.activate(spec, "catppuccin")
