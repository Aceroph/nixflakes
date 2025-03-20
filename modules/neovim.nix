{
  pkgs,
  username,
  home-manager,
  ...
}:

{
  home-manager.users.${username}.programs.neovim = {
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
    extraPackages = with pkgs; [
      nixfmt-rfc-style
      pyright
      rust-analyzer
      isort
      black
      rustfmt
      prettierd
      eslint_d
    ];
    plugins =
      (with pkgs.vimPlugins.nvim-treesitter-parsers; [
        nix
        rust
        python
        javascript
        typescript
        css
        html
      ])
      ++ (with pkgs.vimPlugins; [
        render-markdown-nvim
        mini-nvim
        cheatsheet-nvim
        nvim-lspconfig
        refactoring-nvim
        plenary-nvim
        {
          plugin = conform-nvim;
          config = ''
            			require("conform").setup {
            				format_on_save = {
            					timeout_ms = 500,
            					lsp_format = "fallback",
            				},
            				formatters_by_ft = {
            					nix = { "nixfmt" },
            					python = { "isort", "black" },
            					rust = { "rustfmt" },
            					javascript = { "eslint_d" },
            					html = { "prettierd" },
            					css = { "prettierd" },
            				},
            			}
            		'';
          type = "lua";
        }
        {
          plugin = blink-cmp;
          config = ''
            			local lspconfig = require("lspconfig")
            			local blink = require("blink.cmp")
            			local servers = {
            				pyright = {},
            				rust_analyzer = {},
            			}
            			for server, config in pairs(servers) do
            				config.capabilities = blink.get_lsp_capabilities(config.capabilities)
            				lspconfig[server].setup(config)
            			end
            			blink.setup {
            				keymap = { preset = "enter" },
            				signature = { enabled = true },
            			}
            		'';
          type = "lua";
        }
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
            				highlight = {
            					enable = true,
            					additional_vim_regex_hightlighting = false,
            				},
            			}
            		'';
          type = "lua";
        }
      ]);
  };
}
