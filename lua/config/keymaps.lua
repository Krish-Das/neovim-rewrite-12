local map = require("config.keymap_utils")

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

map("<Esc>", "<CMD>nohlsearch<CR>", "Clear highlights on search")
map("<leader>a", "ggVG", "Select all")

map("$", "$h", "Select upto the end of the line", { "v", "x", "o" })

-- Yanking and pasting text
map("gY", [["+Y]], "Yank current line to system clipboard")
map("gy", [["+y]], "Yank selected text to system clipboard")
map("gy", [["+y]], "Yank selected text to system clipboard", "v")
map("gp", [["_dP]], "Paste text and keep original text in register", "x")

map("<C-\\>", "<CMD>vsplit<CR>", "Vertical Split")

-- delete single character without copying into register
map("x", '"_x')
map("C", '"_C')
map("c", '"_c')

-- Move lines up or down
map("<A-j>", ":m .+1<CR>==", "Move lines down")
map("<A-k>", ":m .-2<CR>==", "Move lines up")
map("<A-j>", ":m '>+1<CR>gv=gv", "Move lines down", "v")
map("<A-k>", ":m '<-2<CR>gv=gv", "Move lines up", "v")

-- Disable <C-w> in insert mode to avoid accidental window-close muscle memory
-- from other apps (e.g., browsers where Ctrl+W closes tabs/windows).
map("<C-w>", "<Nop>", "Disabled: Delete word", "i")

-- Map Ctrl+Backspace → delete previous word.
-- Most terminals send Ctrl+Backspace as <C-h> (ASCII 0x08, shown here as ^H),
-- so we bind that byte to <C-w> to preserve word deletion behavior.
map("\b", "<C-w>", "Delete word", "i")

map("<C-s>", ":update<CR>", "Write current buffer to the file")

-- Join lines below and move cursor where it was
-- map("J", "mzJ`z", "Join the line below")
