# modules/mnw.nix
{
  pkgs,
  mnw,
  self,
}:

{
  mnw = mnw.lib.wrap pkgs {
    neovim = pkgs.neovim-unwrapped;

    luaFiles = [ ./nvim/init.lua ];

    extraBinPath = with pkgs; [
      ripgrep
      fzf

      # LSP:
      lua-language-server
      nixd
      bash-language-server
      shellcheck
      beautysh
      vscode-css-languageserver
      markdownlint-cli2
      gdtoolkit_4

      # Formatters:
      stylua
      nixfmt
      prettierd
    ];

    # Along with listing the package here, each plugin should also be
    # defined through lua as per the Lazy.nvim spec
    #
    # Note: Plugins with dependencies should have their dependencies defined individually
    #       Both as a pkg in the list below, AND in a .lua file as per the Lazy.nvim spec
    #       (A plugin that is only listed as a dependency using the { dependencies } attribute
    #       will make nmw throw errors if is it not sourced individually.)
    plugins = {
      start = [
        pkgs.vimPlugins.lazy-nvim
      ];

      startAttrs = {
        nvim-treesitter = null;
      };

      # Anything that is loaded by Lazy.nvim needs to be in opt
      # use 'lazy = false' in the lazy spec to not lazy-load any plugins
      # that are configured through Lazy.nvim
      opt = [
        pkgs.vimPlugins.plenary-nvim

        pkgs.vimPlugins.oil-nvim
        pkgs.vimPlugins.snacks-nvim
        pkgs.vimPlugins.lualine-nvim
        pkgs.vimPlugins.nvim-web-devicons
        pkgs.vimPlugins.friendly-snippets
        pkgs.vimPlugins.bufferline-nvim # dep: nvim-web-devicons
        pkgs.vimPlugins.nvim-lint
        pkgs.vimPlugins.nvim-lspconfig
        pkgs.vimPlugins.nvim-treesitter
        pkgs.vimPlugins.nvim-treesitter-textobjects
        pkgs.vimPlugins.nvim-ts-autotag
        pkgs.vimPlugins.nvim-ts-context-commentstring
        pkgs.vimPlugins.nvim-notify

        {
          pname = "harpoon-lualine";

          src = pkgs.fetchFromGitHub {
            owner = "letieu";
            repo = "harpoon-lualine";
            rev = "215c0847dfb787b19268f7b42eed83bdcf06b966";
            hash = "sha256-HGbz/b2AVl8145BCy8I47dDrhBVMSQQIr+mWbOrmj5Q=";
          };

        }
      ];

      # We can use optAttrs to rename plugins to their expected name
      # as defined by the lua files
      optAttrs = {
        harpoon = pkgs.vimPlugins.harpoon2;
        "blink.cmp" = pkgs.vimPlugins.blink-cmp;
        "conform.nvim" = pkgs.vimPlugins.conform-nvim;
        "kanagawa.nvim" = pkgs.vimPlugins.kanagawa-nvim;
        "lazydev.nvim" = pkgs.vimPlugins.lazydev-nvim;
        "mini.ai" = pkgs.vimPlugins.mini-ai;
        "mini.comment" = pkgs.vimPlugins.mini-comment;
        "mini.icons" = pkgs.vimPlugins.mini-icons;
        "noice.nvim" = pkgs.vimPlugins.noice-nvim; # deps: nui-nvim nvim-notify
        "persistence.nvim" = pkgs.vimPlugins.persistence-nvim;
        "todo-comments.nvim" = pkgs.vimPlugins.todo-comments-nvim;
        "ts-comments.nvim" = pkgs.vimPlugins.ts-comments-nvim;
        "which-key.nvim" = pkgs.vimPlugins.which-key-nvim;
        "gitsigns.nvim" = pkgs.vimPlugins.gitsigns-nvim;
        "nui.nvim" = pkgs.vimPlugins.nui-nvim;
        "fidget.nvim" = pkgs.vimPlugins.fidget-nvim;
        "roslyn.nvim" = pkgs.vimPlugins.roslyn-nvim;
        "nvim-colorizer.lua" = pkgs.vimPlugins.colorizer;
      };

      dev.codevogel = {
        pure = ./nvim;
        impure = "/home/codevogel/nixos/modules/mnw/nvim";
      };
    };
  };

  dev = self.packages.x86_64-linux.mnw.devMode;
}
