return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup{
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup{
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.4.2" },
                                diagnostics = {
                                    globals = {
                                        "vim",
                                        "it",
                                        "describe",
                                        "before_each",
                                        "after_each"
                                    },
                                }
                            }
                        }
                    }
                end,
            }
        })

        -- Define custom highlight groups for cmp menu
        vim.cmd([[
            highlight CmpItemAbbrDeprecated guifg=#7E8294 gui=strikethrough
            highlight CmpItemAbbrMatch guifg=#7DCFFF
            highlight CmpItemAbbrMatchFuzzy guifg=#7DCFFF
            highlight CmpItemKindVariable guifg=#C3E88D
            highlight CmpItemKindInterface guifg=#674EDE
            highlight CmpItemKindText guifg=#4E63DE
            highlight CmpItemKindFunction guifg=#F78C6C
            highlight CmpItemKindMethod guifg=#F78C6C
            highlight CmpItemKindKeyword guifg=#FFCB6B
            highlight CmpItemKindProperty guifg=#FFCB6B
            highlight CmpItemKindUnit guifg=#FFCB6B
            highlight CmpItemKindFile guifg=#964EDE
        ]])

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            completion = { completeopt = 'menu, menuone, noinsert'},
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Enter>'] = cmp.mapping.confirm({ select = true}),
                ["<C-Space>"] = cmp.mapping.complete({ select = true}),
                ['<M-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<M-j>'] = cmp.mapping.select_next_item(cmp_select),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            }),
        formatting = {
                format = function(entry, vim_item)
                    vim_item.kind = ({
                        Text = "",
                        Method = "󰆧",
                        Function = "󰊕",
                        Constructor = "",
                        Field = "󰇽",
                        Variable = "󰂡",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Snippet = "",
                        Color = "󰏘",
                        File = "󰈙",
                        Reference = "",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "󰅲",
                    })[vim_item.kind] .. " " .. vim_item.kind
                    return vim_item
                end,
            },
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

    end
}
