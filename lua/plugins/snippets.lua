return {
  "L3MON4D3/LuaSnip",
  event = { "BufReadPost", "BufNewFile" },
  opts = { enable_autosnippets = true },
  config = function(_, opts)
    local ls = require("luasnip")
    ls.setup(opts)

    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/snippets",
    })

    local map = require("config.keymap_utils")

    map("<C-e>", function()
      ls.expand()
    end, "Expand snippet", { "i" })

    map("<C-l>", function()
      ls.jump(1)
    end, "Jump to next snippet field", { "i", "s" })

    map("<C-h>", function()
      ls.jump(-1)
    end, "Jump to previous snippet field", { "i", "s" })
  end,
}
