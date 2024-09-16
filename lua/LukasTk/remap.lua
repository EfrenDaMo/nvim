-- Map leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Return to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Return to files" })

-- Line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down" })

-- Quick shorcut
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Exit" })
vim.keymap.set("n", "<leader>ss", "<cmd>w<CR>", { desc = "Quick saving" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and exit" })
vim.keymap.set("n", "<leader>q!", "<cmd>q!<CR>", { desc = "Exit and no saving" })
vim.keymap.set("n", "<leader>sp", "<cmd>set paste!<cr>", { desc = "Set for clean pasting" })

-- Arrow Key disabaling
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move' <CR>")
vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move' <CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move' <CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move' <CR>")

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Folding
vim.keymap.set("n", "ff", "za", { desc = "Toggle folds" })
vim.keymap.set("v", "ff", "zf", { desc = "Set folds" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })
