local home = os.getenv 'HOME'
local workspace_path = home .. '/.local/share/nvim/jdtls-workspace/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = workspace_path .. project_name

local status, jdtls = pcall(require, 'jdtls')
if not status then
    return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
    cmd = {
        'java',
        '--add-modules=ALL-SYSTEM',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '--enable-native-access=ALL-UNNAMED',
        '--sun-misc-unsafe-memory-access=allow',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. vim.fn.glob(home .. '/.local/share/nvim/mason/packages/jdtls/lombok*.jar'),
        '-jar', vim.fn.glob(home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
        '-data',
        workspace_dir,
    },
    root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle', 'build.xml', 'src' },

    settings = {
        java = {
            signatureHelp = { enabled = true },
            extendedClientCapabilities = extendedClientCapabilities,
        },
        format = {
        }
    },

    init_options = {
        bundles = {}
    },

}

require('jdtls').start_or_attach(config)

vim.keymap.set('n', '<leader>co', "<Cmd>lua require('jdtls').organize_imports()<CR>", { desc = 'Organize Imports' })
vim.keymap.set('n', '<leader>crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
vim.keymap.set('v', '<leader>crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
    { desc = 'Extract Variable' })
vim.keymap.set('n', '<leader>crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
vim.keymap.set('v', '<leader>crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
    { desc = 'Extract Constant' })
vim.keymap.set('v', '<leader>crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
    { desc = 'Extract Method' })
vim.keymap.set('n', '<leader>ab', '<Cmd>!ant<CR>', { desc = 'Run Ant Build' })

vim.keymap.set('n', '<leader>fm', '<Cmd>lua vim.lsp.buf.format({ async = true }) <CR>', { desc = "Format file" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename object" })
vim.keymap.set("n", "<leader>li", ":LspInfo<CR>", { desc = "Show LSP info" })

vim.api.nvim_set_hl(0, "@lsp.type.modifier.java", { link = "@keyword" })
