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
      nimlsp
      pyright
      rust-analyzer
      vscode-langservers-extracted
      vue-language-server
      # FMTs
      black
      eslint_d
      isort
      jsonfmt
      nixfmt-rfc-style
      nph
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
        typescript
        vue
      ])
      ++ (with pkgs.vimPlugins; [
        nvim-lspconfig
        markdown-preview-nvim
        mini-statusline
        mini-nvim
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
        {
          plugin = mini-statusline;
          config = builtins.readFile ./plugins/mini-statusline.lua;
          type = "lua";
        }
      ]);
  };
}
