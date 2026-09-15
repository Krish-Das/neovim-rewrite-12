return {
  "ibhagwan/fzf-lua",
  lazy = "VeryLazy",
  opts = {
    fzf_colors = true,
    defaults = { formatter = "path.dirname_first" },
    winopts = { border = "none", preview = { border = "none" } },
    fzf_opts = { ["--info"] = "right" },
  },
  keys = {
    { "<leader>f<space>", "<Cmd>FzfLua<CR>", desc = "Open FZF picker" },
    { "<leader>ff", "<Cmd>FzfLua files<CR>", desc = "Find Files" },
    { "<leader><space>", "<Cmd>FzfLua buffers<CR>", desc = "Find in Buffers" },
    { "<leader>fq", "<Cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
    { "<leader>fg", "<Cmd>FzfLua live_grep<cr>", desc = "Find by Grep" },
    { "<leader>uC", "<Cmd>FzfLua colorschemes<cr>", desc = "Find Colorschemes" },
    { "<leader>fh", "<Cmd>FzfLua helptags<cr>", desc = "Search Help Pages" },
    { "<leader>fk", "<Cmd>FzfLua keymaps<cr>", desc = "Find Keymaps" },
    { "<leader>fs", "<Cmd>FzfLua lsp_document_symbols<cr>", desc = "LSP Document Symbols" },
    { "<leader>fS", "<Cmd>FzfLua lsp_workspace_symbols<cr>", desc = "LSP Workspace Symbols" },
    { "<leader>gg", "<Cmd>FzfLua git_status<cr>", desc = "Git status" },
  },
  config = function(_, opts)
    local fzf = require("fzf-lua")
    fzf.setup(opts)
    fzf.register_ui_select({
      winopts = { height = 1, width = 1, preview = { hidden = "hidden" } },
    })
  end,
}
