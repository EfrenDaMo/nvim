return {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',
	--"L3MON4D3/LuaSnip",
	version = '*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = 'default',

			['<M-y>'] = { 'select_and_accept' },
			['<M-k>'] = { 'select_prev', 'fallback' },
			['<M-j>'] = { 'select_next', 'fallback' },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono'
		},

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		cmdline = {
			enabled = true,

			completion = {
				menu = { auto_show = true },
				ghost_text = { enabled = true }
			},
		},

		term = {
			enabled = true,
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true
				}
			},
			menu = {
				auto_show = true,
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" }
					}
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},
			ghost_text = {
				enabled = true
			}
		},

		signature = {
			enabled = true
		},

		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
