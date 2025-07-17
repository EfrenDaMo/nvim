return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "saghen/blink.cmp",
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        local util = require("lspconfig.util")
        local lspconfig = require("lspconfig")

        require("conform").setup({
            formatters_by_ft = {
                c = { "clang-format" },
                --css = { "css-beautify" },
                go = { "goimports-reviser" },
                html = { "html-beautify" },
                --js = { "js-beautify" },
                lua = { "stylua" },
                php = { "intelephense" },
                python = { "ruff_format" },
                zig = { "zigfmt" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },

            formatters = {
                ["css-beautify"] = {
                    command = "html-beautify",
                    args = {},
                },
                ["html-beautify"] = {
                    command = "html-beautify",
                    args = { "--indent-size", "4", "-I" },
                },
                ["js-beautify"] = {
                    command = "html-beautify",
                    args = {},
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

        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
                { buffer = bufnr, desc = "Rename object" })
            vim.keymap.set("n", "<leader>li", ":LspInfo<CR>",
                { desc = "Show LSP info" })
        end

        local servers = {
            "basedpyright",
            "clangd",
            "gopls",
            "html",
            "intelephense",
            "jinja_lsp",
            "lua_ls",
            "ocamllsp",
            "rust_analyzer",
            "zls",
        }

        local server_configs = {
            denols = {
                root_dir = util.root_pattern({ "deno.json", "deno.jsonc" }),
                single_file_support = false,
                settings = {}
            },
            html = {
                filetypes = { "html", "templ", "php" }
            },
            intelephense = {
                settings = {
                    intelephense = {
                        format = { braces = "k&r" }
                    }
                }
            },
            jinja_lsp = {
                filetypes = { "html", "jinja" }
            },
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.4.2" },
                        diagnostics = {
                            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                        },
                    },
                },
            },
            ocamllsp = {
                cmd = { "dune", "tools", "exec", "ocamllsp" },

                settings = {
                    codelens = { enable = true },
                    inlayHints = { enable = true },
                    syntaxDocumentation = { enable = true },
                },

                server_capabilities = { semanticTokensProvider = false },
            },
            ts_ls = {
                root_dir = util.root_pattern({ "package.json", "tsconfig.json" }),
                single_file_support = false,
                settings = {}
            },
            zls = {
                root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        enable_snippets = true,
                        warn_style = true,
                    },
                },
            },
        }


        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_installation = false,
        })

        for _, server_name in ipairs(servers) do
            local config = server_configs[server_name] or {}
            lspconfig[server_name].setup(vim.tbl_deep_extend("force", {
                capabilities = capabilities,
                on_attach = on_attach
            }, config))
        end

        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0

        lspconfig.clangd.setup({})
        lspconfig.gdscript.setup({})
        lspconfig.gleam.setup({})
        lspconfig.ols.setup({
            capabilities = capabilities,
            on_attach = on_attach,

            init_options = {
                enable_format = true,
                enable_hover = true,
                enable_snippets = true,
                enable_inlay_hints = true,
                check_args = "-strict-style",
            },
        })

        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.HINT] = '󰋖',
                    [vim.diagnostic.severity.INFO] = ' ',
                }
            }
        })

        vim.keymap.set("n", "<leader>l", function()
            local config = vim.diagnostic.config() or {}

            vim.diagnostic.config({
                virtual_text = not config.virtual_text,
                virtual_lines = not config.virtual_lines,
            })
        end, { desc = "Toggle lsp_lines" })
    end,
}
