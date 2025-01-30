return {
    {
        "erikbackman/brightburn.vim",
        "EdenEast/nightfox.nvim",
        "rebelot/kanagawa.nvim",
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000
    },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        name = "tokyonight",

        config = function()
            require("tokyonight").setup({
                terminal_colors = true,

            })
            --vim.cmd("colorscheme tokyonight")
        end
    },
    {
        "rose-pine/neovim",
        priority = 1000,
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                enable = {
                    terminal = true,
                },
            })
            --vim.cmd("colorscheme rose-pine-moon")
        end
    },
    {
        'ray-x/starry.nvim',
        priority = 1000,
        name = "starry",

        config = function()
            require('starry').setup({
                disable = {
                    term_colors = true,
                }
            })
            vim.g.starry_italic_comments = false
            --vim.cmd("colorscheme mariana")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
            })
        end,
    },
    {
        "tiagovla/tokyodark.nvim",
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
        end,
    }
}
