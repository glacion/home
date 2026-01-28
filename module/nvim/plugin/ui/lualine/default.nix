{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.lualine-nvim ];
  xdg.configFile."nvim/plugin/lualine.lua".source = ./config.lua;
}
