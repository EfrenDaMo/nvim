return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,

	---@type snacks.Config
	opts = {
		explorer = {
			enabled = true,
			replace_netrw = false,
		},

		picker = {
			enabled = true,

			-- Telescope layout
			layout = {
				cycle = true,
				reverse = true,
				layout = {
					box = "horizontal",
					title = "Picker for {title}",
					backdrop = false,
					width = 0.9,
					height = 0.75,
					border = "rounded",
					{
						box = "vertical",
						{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
						{
							win = "input",
							height = 1,
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
					},
					{
						win = "preview",
						title = "{preview:Preview}",
						width = 0.5,
						border = "rounded",
						title_pos = "center",
					},
				},
			},
			matcher = {
				cwd_bonus = true,
				frecency = true,
			},

			sources = {
				files = { hidden = true },
				explorer = {
					auto_close = true,
					layout = {
						preview = "main",
						layout = {
							backdrop = false,
							width = 40,
							min_width = 40,
							height = 0,
							position = "left",
							border = "none",
							box = "vertical",
							{
								win = "input",
								height = 1,
								border = "rounded",
								title = "{title} {live} {flags}",
								title_pos = "center",
							},
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
						},
					},
				},

				colorschemes = {
					layout = {
						preview = "main",
						layout = {
							box = "vertical",
							backdrop = false,
							width = 0,
							height = 0.4,
							position = "bottom",
							border = "top",
							title = " {title} {live} {flags}",
							title_pos = "left",
							{ win = "input", height = 1, border = "bottom" },
							{
								box = "horizontal",
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", width = 0.6, border = "left" },
							},
						},
					},
				},
			},
		},
	},
}
