return {
	"folke/snacks.nvim",
	priority = 1000,

	---@type snacks.Config
	opts = {
		git = { enabled = true },
		lazygit = { enabled = true },
		gitbrowse = { enabled = true },
	},

	keys = {
		-- Git keys
		{ "<leader>gb", function() Snacks.git.blame_line() end,   desc = "Show git blame" },
		{ "<leader>gB", function() Snacks.gitbrowse.open() end,   desc = "Open git browser" },

		-- Lazy git
		{ "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Open Lazy git log in nvim" },
		{ "<leader>lg", function() Snacks.lazygit.open() end,     desc = "Open Lazy git window in nvim" },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Open Lazy git log for file in nvim" },
	}
}
