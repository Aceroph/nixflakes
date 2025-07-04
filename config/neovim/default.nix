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
      vscode-langservers-extracted
      lua-language-server
      vue-language-server
      rust-analyzer
      pyright
      nimlsp
      ccls
      nil
      # FMTs
      nixfmt-rfc-style
      clang-tools
      prettierd
      eslint_d
      rustfmt
      jsonfmt
      stylua
      black
      isort
      nph
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
        nim
        c
      ])
      ++ (with pkgs.vimPlugins; [
        markdown-preview-nvim
        plantuml-syntax
        refactoring-nvim
        nvim-lspconfig
        plenary-nvim
        mini-nvim
        yuck-vim
        {
          plugin = telescope-nvim;
          config = builtins.readFile ./telescope.lua;
          type = "lua";
        }
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
          plugin = nvim-treesitter;
          config = builtins.readFile ./treesitter.lua;
          type = "lua";
        }
      ]);
  };
}
