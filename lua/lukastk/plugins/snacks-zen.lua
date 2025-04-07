return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,

	---@type snacks.Config
	opts = {
		zen = {
			enabled = true,

			notify = true,

			toggles = {
				dim = false,
				git_signs = true,
				diagnostics = true,
				inlay_hints = true,
			},

			show = {
				statusline = true,
			},

			win = {
				backdrop = {
					transparent = true
				}
			}
		}
	},
}
