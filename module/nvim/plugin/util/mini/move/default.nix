{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.mini-nvim ];
  xdg.configFile."nvim/plugin/move.lua".source = ./config.lua;
}
