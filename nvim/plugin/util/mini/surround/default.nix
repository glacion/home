{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.mini-nvim ];
  xdg.configFile."nvim/plugin/surround.lua".source = ./config.lua;
}
