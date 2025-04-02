return {
	"laytan/cloak.nvim",
	event = {
		"BufReadPost env",
		"BufReadPost .env",
		"BufReadPost .env*",
		"BufReadPost .dev.vars",
		"BufReadPost wrangler.toml",
	},
	keys = {
		{ "<leader>ce", "<cmd>CloakEnable<cr>", desc = "Enables Cloak" },
		{ "<leader>cd", "<cmd>CloakEnable<cr>", desc = "Disables Cloak" },
	},
	config = function()
		require("cloak").setup({
			lazy = true,
			cloak_character = "+*",
			highlight_group = "String",
			patterns = {
				{
					file_pattern = {
						"env",
						".env*",
						".dev.vars",
						"wrangler.toml",
					},
					cloak_pattern = "=.+",
				},
			},
		})
	end,
}
