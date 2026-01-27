{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.trouble-nvim ];
  xdg.configFile."nvim/plugin/trouble.lua".source = ./config.lua;
}
