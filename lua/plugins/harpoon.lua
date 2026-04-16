return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = function()
    local harpoon = require("harpoon")
    local keys = {
      {
        "<leader>ha",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon: add buffer",
      },
      {
        "<leader>ho",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon: open quick menu",
      },
    }

    for i = 1, 9 do
      table.insert(keys, {
        "<A-" .. i .. ">", -- "<A-i>" alt-i
        function()
          harpoon:list():select(i)
        end,
        desc = "Harpoon: to file " .. i,
      })
    end
    return keys
  end,
}
