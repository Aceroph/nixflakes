{ pkgs, config, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		extraLuaConfig = ''
			-- Options
			vim.o.number = true
			vim.o.tabstop = 4
			vim.o.shiftwidth = 4
			
			-- Keybinds
			vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show error at cursor" })
			vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope - Find files" })
		'';
		extraConfig = ''
			colorscheme retrobox
			let mapleader = "\<Space>"
		'';
		coc = {
			enable = true;
		};
		plugins = with pkgs.vimPlugins; [
			coc-pyright
			coc-eslint
			coc-rust-analyzer
			render-markdown-nvim
			mini-nvim
			cheatsheet-nvim
			nvim-lspconfig
			refactoring-nvim
			plenary-nvim
			{
				plugin = toggleterm-nvim;
				config = ''
					require("toggleterm").setup {
						open_mapping = [[<c-t>]],
						size = vim.o.columns * 0.4,
						hide_numbers = true,
						start_in_insert = true,
						close_on_exit = true,
						direction = "vertical",
					}
				'';
				type = "lua";
			}
			{
				plugin = telescope-nvim;
				config = ''
					require("telescope").setup {
						defaults = {
							file_ignore_patterns = {
								"node_modules",
								"target"
							}
						}
					}
				'';
				type = "lua";
			}
			{
				plugin = nvim-treesitter;
				config = ''
					vim.opt.runtimepath:prepend("~/.local/share/nvim/site/parser/")
					require("nvim-treesitter.configs").setup {
						parser_install_dir = "~/.local/share/nvim/site/parser/",
						auto_install = true,
						sync_install = false,
						highlight = {
							enable = true,
							additional_vim_regex_hightlighting = false,
						},
					}
				'';
				type = "lua";
			}
		];
	};
}
