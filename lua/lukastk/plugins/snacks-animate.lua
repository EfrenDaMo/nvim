return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,

	---@type snacks.Config
	opts = {
		animate = {
			enabled = true,
			duration = 30,
			easing = "linear",
			fps = 60,
		},

		indent = {
			indent = {
				enabled = true,
				only_scope = false,
				only_current = true,
			},

			animate = {
				enabled = true,
				style = "up_down",
				duration = {
					step = 10,
				},
			},

			scope = {
				enabled = true,
				underline = true,
			},

			chunk = {
				enabled = false,
				char = {
					corner_top = "╭",
					corner_bottom = "╰",
				},
			},
		},
	},
}
