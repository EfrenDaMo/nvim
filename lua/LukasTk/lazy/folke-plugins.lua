return {
	{
		'folke/todo-comments.nvim',
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			keywords = {
				HACK = { icon = " ", color = "#FB7C24" },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			},
		},
		keys = {
			{ "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
			{ "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
		}
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>tT",
				"<c>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"folke/persistence.nvim",
		lazy = true,
		opts = {}
	},
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		dependencies = { 'Bilal2453/luvit-meta' },

		opts = {
			library = {
				{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
				{ path = "snacks.nvim",        words = { "Snacks" } },
			},
		},
	},
}
