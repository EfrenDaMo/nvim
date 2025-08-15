-- Set number bar
vim.opt.number = true
vim.opt.relativenumber = true

-- Removes end of line
vim.opt.fixendofline = false

-- Remove the netrw banner
vim.g.netrw_banner = 0

-- Configure the RIGHT use of spacing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Fold stuff
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Backup stuff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Searching stuff
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable Proper colors
vim.opt.termguicolors = true

-- Enables cross clipboard
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Extra stuff
vim.opt.smartindent = true

-- Disable the worst default
vim.opt.wrap = false

-- Relative nu stuff and signs
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

-- How fast it updates
vim.opt.updatetime = 50

-- Sets a limiter for code length
vim.opt.colorcolumn = "110"

-- Disable mouse
vim.opt.mouse = "a"

-- Ensure correct splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

vim.opt.showmode = false
