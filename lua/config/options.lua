-- Title
vim.opt.title = true
vim.opt.titlestring = "neovim"

-- Relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Remove the ~ from empty lines
vim.opt.fillchars = { eob = " " }

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.autoindent = true

-- Enable smart indenting
-- (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable text wrap
vim.opt.wrap = false
vim.opt.linebreak = true

vim.g.have_nerd_font = false

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Decrease updatetime to 50ms
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable access to System Clipboard
-- vim.opt.clipboard = "unnamed,unnamedplus"
-- plus-register(System) -> "+{y p}
-- star-register -> "*{y p}
-- check registers -> :register<cr>

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 1

-- Disable commandline until it is needed.
-- This gives us a cleaner look and an extra line
vim.opt.cmdheight = 0

-- Enable persistent undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.showmode = false

-- Disable the welcome message
-- vim.opt.shortmess:append("I")

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
