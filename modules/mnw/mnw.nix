# modules/mnw.nix
{ pkgs, mnw, self }:

{
  mnw = mnw.lib.wrap pkgs {
    neovim = pkgs.neovim-unwrapped;

    luaFiles = [ ./nvim/init.lua ];

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
      ];

      # We can use optAttrs to rename plugins to their expected name
      # as defined by the lua files
      optAttrs = {
        harpoon = pkgs.vimPlugins.harpoon2;
        "blink.cmp" = pkgs.vimPlugins.blink-cmp;
      };

      dev.codevogel = {
        pure = ./nvim;
        impure = "/home/codevogel/nixos/modules/mnw/nvim";
      };
    };
  };

  dev = self.packages.x86_64-linux.mnw.devMode;
}

