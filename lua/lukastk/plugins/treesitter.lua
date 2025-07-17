return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc",
                "c",
                "lua",
                "bash",
                "java",
            },

            sync_install = false,

            auto_install = true,

            indent = {
                enable = true,
            },

            highlight = {
                enable = true,

                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")

        -- Custom highlight for variables
        --vim.api.nvim_set_hl(0, "@variable", { fg = "#bb9af7", bold = true })
        vim.api.nvim_set_hl(0, "@variable", { bold = true })
    end,
}
