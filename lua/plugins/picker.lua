return {
  "ibhagwan/fzf-lua",
  lazy = "VeryLazy",
  opts = {
    fzf_colors = true,
    defaults = { formatter = "path.dirname_first" },
    fzf_opts = {
      ["--info"] = "right",
    },
  },
  keys = {
    { "<leader>f<space>", "<CMD>FzfLua<CR>", desc = "Open FZF picker" },
    { "<leader>ff", "<CMD>FzfLua files<CR>", desc = "Find Files" },
    { "<leader><space>", "<CMD>FzfLua buffers<CR>", desc = "Find in Buffers" },
    { "<leader>fq", "<CMD>FzfLua quickfix<cr>", desc = "Quickfix List" },
    { "<leader>fg", "<CMD>FzfLua live_grep<cr>", desc = "Find by Grep" },
    { "<leader>uC", "<CMD>FzfLua colorschemes<cr>", desc = "Find Colorschemes" },
    { "<leader>fh", "<CMD>FzfLua helptags<cr>", desc = "Search Help Pages" },
    { "<leader>fk", "<CMD>FzfLua keymaps<cr>", desc = "Find Keymaps" },
    { "<leader>fs", "<CMD>FzfLua lsp_document_symbols<cr>", desc = "LSP Document Symbols" },
    { "<leader>fS", "<CMD>FzfLua lsp_workspace_symbols<cr>", desc = "LSP Workspace Symbols" },
    { "<leader>gg", "<CMD>FzfLua git_status<cr>", desc = "Git status" },
  },
  config = function(_, opts)
    local fzf = require("fzf-lua")
    fzf.setup(opts)
    fzf.register_ui_select({
      winopts = { height = 1, width = 1, preview = { hidden = "hidden" } },
    })
  end,
}
