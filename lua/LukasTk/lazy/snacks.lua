return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	event = "UIEnter",

	---@type snacks.Config
	opts = {
		image = { enabled = true },
		input = { enabled = true },
		words = { enabled = true },
		scope = { enabled = true },
		toggle = { enabled = true },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },

		scratch = {
			enable = true,
			name = "Scratchpad"
		},
	},
}
