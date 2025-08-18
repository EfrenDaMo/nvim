return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    event = "UIEnter",

    ---@type snacks.Config
    opts = {
        image = { enabled = false },
        input = { enabled = true },
        words = { enabled = true },
        scope = { enabled = true },
        toggle = { enabled = true },
        bigfile = { enabled = true },
        statuscolumn = { enabled = true },
        git = { enabled = true },
        lazygit = { enabled = true },
        gitbrowse = { enabled = true },
    },
}
