{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.noice-nvim ];
  xdg.configFile."nvim/plugin/noice.lua".source = ./config.lua;
}
