return {
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ["<C-space>"] = {
        function(cmp)
          cmp.show()
        end,
      },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      ghost_text = { enabled = false, show_with_menu = false },
      menu = { auto_show = false },
      documentation = { auto_show = false },
    },
    signature = { enabled = false },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = { "exact", "score", "sort_text" },
    },
  },
  -- opts_extend = { "sources.default" },
}
