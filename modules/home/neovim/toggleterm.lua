require("toggleterm").setup {
	open_mapping = [[<c-t>]],
	size = vim.o.columns * 0.4,
	hide_numbers = true,
	start_in_insert = true,
	close_on_exit = true,
	direction = "vertical",
}
