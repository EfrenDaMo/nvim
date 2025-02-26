return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    version = "",

    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        -- REQUIRED
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>E", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<leader>e", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })

        vim.keymap.set("n", "<leader>H", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>T", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>N", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>S", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end)
    end
}
