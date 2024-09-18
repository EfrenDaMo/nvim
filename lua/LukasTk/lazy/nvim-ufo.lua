return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",

    config = function ()
        vim.keymap.set('n', 'Ff', require('ufo').openAllFolds, { desc = "Open all folds" })
        vim.keymap.set('n', 'FF', require('ufo').closeAllFolds, { desc = "Close all folds"})
        vim.keymap.set('n', 'FP', function ()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end, { desc = "Peek Fold"})

        require('ufo').setup({
            provider_selector = function (bufnr, filetype, buftype)
                return {'lsp', 'indent'}
            end
        })
    end,
}
