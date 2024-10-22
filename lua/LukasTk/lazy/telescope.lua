return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')

        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = 'View git files' })
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = 'List files' })
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = 'View Helptags' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
        vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = 'Search Select Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current Word' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by Grep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })

        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = 'Search for word' })

        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = 'Search for word case sensitive' })

        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = 'Search for a grep string' })

        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = 'Search Neovim files' })
    end
}
