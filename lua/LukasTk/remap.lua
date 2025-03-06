-- Map leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Return to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Return to files" })

-- Line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Folding
vim.keymap.set("n", "<leader>ff", "za", { desc = "Toggle folds" })
vim.keymap.set("v", "<leader>ff", "zf", { desc = "Set folds" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- Toggle inlayhints
vim.keymap.set("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { desc = "Enable inlayhints" })
