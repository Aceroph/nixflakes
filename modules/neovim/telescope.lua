require("telescope").setup {
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--no-require-git" }
		}
	}
}
