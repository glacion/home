{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.onedarkpro-nvim ];
  xdg.configFile."nvim/plugin/onedarkpro.lua".source = ./config.lua;
  xdg.configFile."nvim/lua/color.lua".source = ./color.lua;
}
