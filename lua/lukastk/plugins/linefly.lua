return {
	"bluz71/nvim-linefly",

	config = function()
		vim.g.linefly_options = {
			error_symbol = " ",
			warning_symbol = " ",
			information_symbol = " ",

			with_indent_status = true,
		}
	end,
}
