return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"saghen/blink.cmp",
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort" },
			},
		})

		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"basedpyright",
				"gopls",
				"rust_analyzer",
				"zls",
			},

			automatic_installation = false,

			handlers = {
				function(server_name)
					if server_name ~= "jdtls" then
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.4.2" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		--[[
		lspconfig.clangd.setup({})
		lspconfig.gleam.setup({})
		lspconfig.gdscript.setup({})
		]]
		--
	end,
}
