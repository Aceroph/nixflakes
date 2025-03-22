{
  pkgs,
  username,
  ...
}:

{
  home-manager.users.${username}.programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = builtins.readFile ./options.lua;
    extraConfig = builtins.readFile ./options.vim;
    extraPackages = with pkgs; [
      # LSPs
      vscode-langservers-extracted
      lua-language-server
      vue-language-server
      rust-analyzer
      pyright
      nil
      # FMTs
      nixfmt-rfc-style
      prettierd
      eslint_d
      rustfmt
      jsonfmt
      stylua
      black
      isort
      # Extras
      ripgrep
    ];
    plugins =
      (with pkgs.vimPlugins.nvim-treesitter-parsers; [
        javascript
        typescript
        python
        html
        rust
        nix
        lua
        css
        vue
      ])
      ++ (with pkgs.vimPlugins; [
        render-markdown-nvim
        cheatsheet-nvim
        # refactoring-nvim yet to configure..
        nvim-lspconfig
        plenary-nvim
        mini-nvim
        {
          plugin = conform-nvim;
          config = builtins.readFile ./conform.lua;
          type = "lua";
        }
        {
          plugin = blink-cmp;
          config = builtins.readFile ./blink.lua;
          type = "lua";
        }
        {
          plugin = toggleterm-nvim;
          config = builtins.readFile ./toggleterm.lua;
          type = "lua";
        }
        {
          plugin = telescope-nvim;
          config = builtins.readFile ./telescope.lua;
          type = "lua";
        }
        {
          plugin = nvim-treesitter;
          config = builtins.readFile ./treesitter.lua;
          type = "lua";
        }
      ]);
  };
}
