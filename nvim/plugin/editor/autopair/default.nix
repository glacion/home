{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-autopairs ];
  xdg.configFile."nvim/plugin/autopair.lua".source = ./config.lua;
}
