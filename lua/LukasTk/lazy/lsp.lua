return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },

	dependencies = {
		"saghen/blink.cmp",
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"tjdevries/ocaml.nvim",
			build = "make",
		},
	},

	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports-reviser" },
				c = { "clang-format" },
				php = { "pretty-php" },
				js = { "js-beautify" },
				--css = { "css-beautify" },
				html = { "html-beautify" },
				zig = { "zigfmt" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},

			formatters = {
				["js-beautify"] = {
					command = "html-beautify",
					args = {},
				},
				["css-beautify"] = {
					command = "html-beautify",
					args = {},
				},
				["html-beautify"] = {
					command = "html-beautify",
					args = { "--indent-size", "4", "-I" },
				},
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
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.4.2" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				["ols"] = function()
					lspconfig.ols.setup({
						init_options = {
							enable_format = true,
							enable_hover = true,
							enable_snippets = true,
							enable_inlay_hints = true,
							check_args = "-strict-style",
						},
					})
				end,

				["zls"] = function()
					lspconfig.zls.setup({
						capabilities = capabilities,
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})

					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,
			},
		})

		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
		vim.keymap.set("", "<leader>l", function()
			local config = vim.diagnostic.config() or {}
			if config.virtual_text then
				vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
			else
				vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
			end
		end, { desc = "Toggle lsp_lines" })

		local signs = { Error = " ", Warn = " ", Hint = "󰋖", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				_ = args
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0, desc = "Rename object" })
			end,
		})

		lspconfig.clangd.setup({})
		lspconfig.gdscript.setup({})
		lspconfig.gleam.setup({})
		lspconfig.phpactor.setup({
			root_dir = function()
				return vim.loop.cwd()
			end,

			init_options = {
				["language_server.diagnostics_on_update"] = false,
				["language_server.diagnostics_on_open"] = false,
				["language_server.diagnostics_on_save"] = false,
				["language_server_phpstan.enabled"] = false,
				["language_server_psalm.enabled"] = false,
			},
		})
		lspconfig.html.setup({
			filetypes = { "html", "templ", "php" },
		})

		lspconfig.jinja_lsp.setup({
			capabilities = capabilities,
			filetypes = { "html", "jinja" },
		})

		require("ocaml").setup()

		lspconfig["ocamllsp"].setup({
			cmd = { "dune", "tools", "exec", "ocamllsp" },

			settings = {
				codelens = { enable = true },
				inlayHints = { enable = true },
				syntaxDocumentation = { enable = true },
			},

			server_capabilities = { semanticTokensProvider = false },
		})
	end,
}
