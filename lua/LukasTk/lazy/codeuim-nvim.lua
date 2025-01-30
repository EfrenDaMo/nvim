return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            vim.keymap.set("n", "<leader>cc", "<cmd>Codeium Chat<CR>", { desc = "Codeium Chat" })
        })
    end
}
