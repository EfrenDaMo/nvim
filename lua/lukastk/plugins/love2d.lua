return {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = {},

    keys = {
        { "<leader>vv", ft = "lua",          desc = "start LÖVE lsp" },
        { "<leader>lr", "<cmd>LoveRun<cr>",  ft = "lua",             desc = "Run LÖVE" },
        { "<leader>ls", "<cmd>LoveStop<cr>", ft = "lua",             desc = "Stop LÖVE" },
    },
}
