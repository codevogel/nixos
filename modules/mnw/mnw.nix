# modules/mnw.nix
{ pkgs, mnw, self }:

{
  mnw = mnw.lib.wrap pkgs {
    neovim = pkgs.neovim-unwrapped;

    luaFiles = [ ./nvim/init.lua ];

    plugins = {
      start = [
        pkgs.vimPlugins.lazy-nvim
      ];

      opt = [
        pkgs.vimPlugins.plenary-nvim
        pkgs.vimPlugins.oil-nvim
        pkgs.vimPlugins.snacks-nvim
        pkgs.vimPlugins.lualine-nvim
        pkgs.vimPlugins.nvim-web-devicons
      ];

      optAttrs = {
        harpoon = pkgs.vimPlugins.harpoon2;
      };

      dev.codevogel = {
        pure = ./nvim;
        impure = "/home/codevogel/nixos/modules/mnw/nvim";
      };
    };
  };

  dev = self.packages.x86_64-linux.mnw.devMode;
}

