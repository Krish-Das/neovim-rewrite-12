return {
  "lewis6991/gitsigns.nvim",
  event = { "BufEnter" },
  opts = {
    current_line_blame = true,
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = "GSigns: " .. desc })
      end

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next hunk")

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Prev hunk")

      map("n", "<leader>hs", gs.stage_hunk, "Hunk Stage")
      map("n", "<leader>hr", gs.reset_hunk, "Hunk Reset")
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Hunk Stage")
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Hunk Reset")
      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>hi", gs.preview_hunk_inline, "Inline preview")
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>hd", gs.diffthis, "Diff this")
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, "Diff this ~")
      map("n", "<leader>hQ", function()
        gs.setqflist("all")
      end, "Quickfix list all")
      map("n", "<leader>tgs", gs.toggle_signs, "Toggle signs")
      map("n", "<leader>tgl", gs.toggle_linehl, "Toggle line highlight")
      map("n", "<leader>tgb", gs.toggle_current_line_blame, "Toggle line blame")
      map("n", "<leader>tgw", gs.toggle_word_diff, "Toggle word diff")
      map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
    end,
  },
}
