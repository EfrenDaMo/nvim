local colorschemes = {
    "brightburn",
    "carbonfox",
    "catppuccin-frappe",
    "catppuccin-macchiato",
    "catppuccin-mocha",
    "default",
    "desert",
    "duskfox",
    "elflord",
    "gruvbox",
    "habamax",
    "kanagawa-dragon",
    "kanagawa-wave",
    "mariana",
    "moonfly",
    "nightfly",
    "nightfox",
    "nordfox",
    "onedark",
    "onedark_vivid",
    "onedark_dark",
    "rose-pine-main",
    "rose-pine-moon",
    "terafox",
    "tokyonight-night",
    "tokyonight-moon",
    "tokyonight-storm",
}

return {
    "zaldih/themery.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("themery").setup({
            livePreview = true,
            themes = colorschemes
        })

        vim.keymap.set('n', '<leader>tp', "<cmd>Themery<CR>", { desc = "change colorscheme" })
    end
}
