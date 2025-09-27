{
  username,
  pkgs,
  ...
}:

{
  home-manager.users.${username}.programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    extraLuaConfig = builtins.readFile ./options.lua;
    extraConfig = builtins.readFile ./options.vim;
    extraPackages = with pkgs; [
      # LSPs
      angular-language-server
      lua-language-server
      nil
      pyright
      rust-analyzer
      typescript-language-server
      vscode-langservers-extracted
      vue-language-server
      # FMTs
      black
      isort
      jsonfmt
      nixfmt-rfc-style
      prettierd
      rustfmt
      stylua
      # Extras
      clang-tools
      ripgrep
    ];
    plugins =
      (with pkgs.vimPlugins.nvim-treesitter-parsers; [
        angular
        c
        css
        html
        javascript
        lua
        nim
        nix
        python
        rust
        scss
        typescript
        vue
      ])
      ++ (with pkgs.vimPlugins; [
        actions-preview-nvim
        markdown-preview-nvim
        mini-nvim
        neo-tree-nvim
        nvim-lspconfig
        plantuml-syntax
        plenary-nvim
        which-key-nvim
        {
          plugin = nvim-dap;
          config = builtins.readFile ./plugins/dap.lua;
          type = "lua";
        }
        {
          plugin = telescope-nvim;
          config = builtins.readFile ./plugins/telescope.lua;
          type = "lua";
        }
        {
          plugin = conform-nvim;
          config = builtins.readFile ./plugins/conform.lua;
          type = "lua";
        }
        {
          plugin = blink-cmp;
          config = builtins.readFile ./plugins/blink.lua;
          type = "lua";
        }
        {
          plugin = nvim-treesitter;
          config = builtins.readFile ./plugins/treesitter.lua;
          type = "lua";
        }
      ]);
  };
}
