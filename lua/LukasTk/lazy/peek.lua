return {
	"toppair/peek.nvim",
	lazy = true,
	build = "deno task --quiet build:fast",
	config = function()
		require("peek").setup()
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

		require('peek').setup({
			app = 'browser',
		})
	end,

	keys = {
		{ "<leader>po", "<cmd>PeekOpen<cr>",  desc = "Open peek window in browser for markup files" },
		{ "<leader>pc", "<cmd>PeekClose<cr>", desc = "Close peek window in browser for markup files" }
	}
}
