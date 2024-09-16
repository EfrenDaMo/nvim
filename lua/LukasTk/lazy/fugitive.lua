return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

		local LukasTk_Fugitive = vim.api.nvim_create_augroup("LukasTk_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = LukasTk_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "<leader>gp", function()
					vim.cmd.Git("push")
				end, opts)

				-- rebase always
				vim.keymap.set("n", "<leader>gP", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)

				--vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts);
			end,
		})

		vim.keymap.set("n", "<leader>gu", "<cmd>diffget //2<CR>")
		vim.keymap.set("n", "<leader>gh", "<cmd>diffget //3<CR>")
	end,
}
