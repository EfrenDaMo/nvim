vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.fixendofline = false

vim.g.netrw_banner = 0
--vim.g.netrw_liststyle = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "130"

vim.opt.showmode = false

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

vim.opt.mouse = "a"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

local signs = { Error = " ", Warn = " ", Hint = "󰋖", Info = " " }

local severity_map = {
	[vim.diagnostic.severity.ERROR] = "Error",
	[vim.diagnostic.severity.WARN] = "Warn",
	[vim.diagnostic.severity.INFO] = "Info",
	[vim.diagnostic.severity.HINT] = "Hint",
}

vim.diagnostic.config({ virtual_lines = true })

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		prefix = function(diagnostic)
			local level = severity_map[diagnostic.severity]
			return signs[level]
		end,
		spacing = 0,
	},
	signs = true,
	underline = true,
})
