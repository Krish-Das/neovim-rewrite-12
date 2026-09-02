return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "folke/noice.nvim", "MunifTanjim/nui.nvim" },
  config = function()
    local noice = require("noice")

    ---@diagnostic disable-next-line: unused-function, unused-local
    local function truncate_branch_name(branch)
      if not branch or branch == "" then
        return ""
      end

      -- Match the branch name to the specified format
      local user, team, ticket_number = string.match(branch, "^(%w+)/(%w+)%-(%d+)")

      -- If the branch name matches the format, display {user}/{team}-{ticket_number}, otherwise display the full branch name
      if ticket_number then
        return user .. "/" .. team .. "-" .. ticket_number
      else
        return branch
      end
    end

    require("lualine").setup({
      options = {
        theme = { normal = { a = { gui = "bold" } } },
        globalstatus = false,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_b = {
          {
            noice.api.statusline.mode.get,
            cond = noice.api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          -- { "branch", icon = "", fmt = truncate_branch_name },
          { "diff", symbols = { added = "+", modified = "~", removed = "-" } },
          {
            "diagnostics",
            sources = { "nvim_lsp", "nvim_diagnostic" },

            sections = { "error", "warn", "info", "hint" },

            diagnostics_color = {
              error = "DiagnosticError",
              warn = "DiagnosticWarn",
              info = "DiagnosticInfo",
              hint = "DiagnosticHint",
            },
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
        },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
      },
    })
  end,
}
