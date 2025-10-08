local vkm = vim.keymap

return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,

    keys = {
        --  Jumps around the word references
        { "]]",              function() Snacks.words.jump(vim.v.count1) end,       desc = "Next Reference",                mode = { "n", "t" } },
        { "[[",              function() Snacks.words.jump(-vim.v.count1) end,      desc = "Prev Reference",                mode = { "n", "t" } },

        -- Return to dashboard
        { "<leader>qq",      function() Snacks.dashboard.open() end,               desc = "Return to dashboard" },

        -- Show notification history
        { "<leader>nh",      function() Snacks.notifier.show_history() end,        desc = "Show notification history" },

        -- Scratch(pad) stuff
        { "<leader>sP",      function() Snacks.scratch.select() end,               desc = "Select a scratch(pad) buffer" },
        { "<leader>sp",      function() Snacks.scratch() end,                      desc = "Toggle the scratch(pad) buffer" },

        -- Delete buffer
        { "<leader>bd",      function() Snacks.bufdelete() end,                    desc = "Delete Buffer" },

        -- Top pickers
        { "<leader>sg",      function() Snacks.picker.grep() end,                  desc = "Grep Picker" },
        { "<leader>fb",      function() Snacks.picker.buffers() end,               desc = "Buffer Picker" },
        { "<leader><space>", function() Snacks.picker.smart() end,                 desc = "Smart File Picker" },
        { "<leader>ch",      function() Snacks.picker.command_history() end,       desc = "Command History Picker" },
        { "<leader>nh",      function() Snacks.picker.notifications() end,         desc = "Notification History Picker" },

        -- File pickers
        { "<leader>pf",      function() Snacks.picker.files() end,                 desc = "File Picker" },
        { "<leader>pp",      function() Snacks.picker.projects() end,              desc = "Project Picker" },
        { "<leader>pg",      function() Snacks.picker.git_files() end,             desc = "Git File Picker" },
        { "<leader>pr",      function() Snacks.picker.recent() end,                desc = "Recent File Picker" },

        -- Git pickers
        { "<leader>Gl",      function() Snacks.picker.git_log() end,               desc = "Git Log Picker" },
        { "<leader>GS",      function() Snacks.picker.git_stash() end,             desc = "Git Stash Picker" },
        { "<leader>Gs",      function() Snacks.picker.git_status() end,            desc = "Git Status Picker" },
        { "<leader>Gb",      function() Snacks.picker.git_branches() end,          desc = "Git Branches Picker" },
        { "<leader>GL",      function() Snacks.picker.git_log_line() end,          desc = "Git Log Line Picker" },
        { "<leader>Gf",      function() Snacks.picker.git_log_file() end,          desc = "Git Log File Picker" },
        { "<leader>Gd",      function() Snacks.picker.git_diff() end,              desc = "Git Diff Line Picker" },

        -- Grep pickers
        { "<leader>sb",      function() Snacks.picker.lines() end,                 desc = "Buffer Lines Picker" },
        { "<leader>sw",      function() Snacks.picker.grep_word() end,             desc = "Search selected word" },
        { "<leader>sB",      function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers Picker" },

        -- Search pickers
        { "<leader>sa",      function() Snacks.picker.autocmds() end,              desc = "Autocmds Picker" },
        { "<leader>sC",      function() Snacks.picker.commands() end,              desc = "Commands Picker" },
        { "<leader>sd",      function() Snacks.picker.diagnostics() end,           desc = "Diagnostics Picker" },
        { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics Picker" },
        { "<leader>vh",      function() Snacks.picker.help() end,                  desc = "Help Pages Picker" },
        { "<leader>sh",      function() Snacks.picker.search_history() end,        desc = "Search History Picker" },
        { "<leader>sH",      function() Snacks.picker.highlights() end,            desc = "Highlights Picker" },
        { "<leader>si",      function() Snacks.picker.icons() end,                 desc = "Icons Picker" },
        { "<leader>sj",      function() Snacks.picker.jumps() end,                 desc = "Jumps Picker" },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,               desc = "Keymaps Picker" },
        { "<leader>sl",      function() Snacks.picker.loclist() end,               desc = "Location List Picker" },
        { "<leader>sm",      function() Snacks.picker.marks() end,                 desc = "Marks Picker" },
        { "<leader>sM",      function() Snacks.picker.man() end,                   desc = "Man Pages Picker" },
        { "<leader>sL",      function() Snacks.picker.lazy() end,                  desc = "Search for Plugin Spec Picker" },
        { "<leader>sq",      function() Snacks.picker.qflist() end,                desc = "Quickfix List Picker" },
        { "<leader>sr",      function() Snacks.picker.resume() end,                desc = "Resume Picker" },
        { "<leader>sR",      function() Snacks.picker.registers() end,             desc = "Registers Picker" },
        { "<leader>su",      function() Snacks.picker.undo() end,                  desc = "Undo History" },

        -- LSP pickers
        { "gd",              function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
        { "gD",              function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
        { "gr",              function() Snacks.picker.lsp_references() end,        nowait = true,                          desc = "References" },
        { "gI",              function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
        { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols Picker" },
        { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols Picker" },

        -- Set toggle stuff
        vkm.set("n", "<leader>td", function() Snacks.toggle.dim():toggle() end, { desc = "Toggle dimming" }),
        vkm.set("n", "<leader>tD", function() Snacks.toggle.diagnostics():toggle() end, { desc = "Toggle Diagnostics" }),
        vkm.set("n", "<leader>tz", function() Snacks.toggle.zen():toggle() end, { desc = "Toggle Zen Mode" }),
        vkm.set("n", "<leader>tZ", function() Snacks.toggle.zoom():toggle() end, { desc = "Toggle Zen Mode" }),

        -- Git keys
        { "<leader>gb", function() Snacks.git.blame_line() end,   desc = "Show git blame" },
        { "<leader>gB", function() Snacks.gitbrowse.open() end,   desc = "Open git browser" },

        -- Lazy git
        { "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Open Lazy git log in nvim" },
        { "<leader>lg", function() Snacks.lazygit.open() end,     desc = "Open Lazy git window in nvim" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Open Lazy git log for file in nvim" },
    },
}
