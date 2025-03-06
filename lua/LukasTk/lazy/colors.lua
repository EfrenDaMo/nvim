return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		name = "tokyonight",

		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				terminal_colors = true,
				styles = {},
			})
			--vim.cmd("colorscheme tokyonight")
		end
	},
	{
		"rose-pine/neovim",
		lazy = true,
		priority = 1000,
		name = "rose-pine",

		config = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
				disable_background = true
			})
			--vim.cmd("colorscheme rose-pine")
		end

	}
}
