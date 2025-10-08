return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    version = "",
    event = { "BufReadPost", "BufNewFile" },

    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup({})

        -- Harpoon picker for snacks
        local function generate_harpoon_picker()
            local file_paths = {}
            for _, item in ipairs(harpoon:list().items) do
                table.insert(file_paths, {
                    text = item.value,
                    file = item.value,
                })
            end
            return file_paths
        end

        -- REQUIRED

        -- Add file to list
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Add to harpoon" })

        -- Open snacks.picker window
        vim.keymap.set("n", "<leader>e", function()
            Snacks.picker({
                finder = generate_harpoon_picker,
                win = {
                    input = {
                        keys = {
                            ["dd"] = { "harpoon_delete", mode = { "n", "x" } },
                        },
                    },
                    list = {
                        keys = {
                            ["dd"] = { "harpoon_delete", mode = { "n", "x" } },
                        },
                    },
                },
                actions = {
                    harpoon_delete = function(picker, item)
                        local to_remove = item or picker:selected()
                        table.remove(harpoon:list().items, to_remove.idx)
                        picker:find({
                            refresh = true, -- refresh picker after removing values
                        })
                    end,
                },
                layout = {
                    preview = false,

                    layout = {
                        backdrop = false,
                        width = 0.5,
                        min_width = 80,
                        height = 0.4,
                        min_height = 3,
                        box = "vertical",
                        border = "rounded",
                        title = "{title}",
                        title_pos = "center",
                        { win = "list",    border = "none" },
                        { win = "preview", title = "{preview}", height = 0.4,  border = "bottom" },
                        { win = "input",   height = 1,          border = "top" },
                    },
                },
                files = {
                    on_show = function()
                        vim.cmd.stopinsert()
                    end,
                },
            })
        end, { desc = "Open Harpoon in picker" })

        -- Plenary keys

        -- show plenary picker
        vim.keymap.set("n", "<leader>E", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open Harpoon in plenary" })

        -- Select from list
        vim.keymap.set("n", "<leader>H", function()
            harpoon:list():select(1)
        end, { desc = "Select first harpoon file" })
        vim.keymap.set("n", "<leader>T", function()
            harpoon:list():select(2)
        end, { desc = "Select second harpoon file" })
        vim.keymap.set("n", "<leader>N", function()
            harpoon:list():select(3)
        end, { desc = "Select third harpoon file" })
        vim.keymap.set("n", "<leader>S", function()
            harpoon:list():select(4)
        end, { desc = "Select fourth harpoon file" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hp", function()
            harpoon:list():prev()
        end, { desc = "Toggle to previous harpoon file" })
        vim.keymap.set("n", "<leader>hn", function()
            harpoon:list():next()
        end, { desc = "Toggle to next harpoon file" })
    end,
}
