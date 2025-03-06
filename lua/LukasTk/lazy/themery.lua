local themes = {
	"rose-pine-moon",
	"tokyonight-moon",
}

return {
	"zaldih/themery.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("themery").setup({
			livePreview = true,
			themes = themes
		})

		vim.keymap.set('n', '<leader>tp', "<cmd>Themery<CR>", { desc = "change colorscheme" })
	end
}
