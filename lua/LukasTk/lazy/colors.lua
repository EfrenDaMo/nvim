return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	name = "tokyonight",

	config = function()
		require("tokyonight").setup({
			style = "moon",
			transparent = true,
			terminal_colors = true,
			styles = {},
		})
		vim.cmd("colorscheme tokyonight")
	end,
}
