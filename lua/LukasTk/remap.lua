-- Map leader
vim.g.mapleader = " "

-- Return to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quick shorcut
vim.keymap.set("n", "<leader>sp", "<cmd>set paste!<cr>")
vim.keymap.set("n", "<leader>ss", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>")

-- Arrow Key disabaling
vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move' <CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move' <CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move' <CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move' <CR>")

-- Folding
vim.keymap.set("n", "ff", "za") -- Toggle fold
vim.keymap.set("v", "ff", "zf") -- Set fold

-- Yap(Yank around paragraph)
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
