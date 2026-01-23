{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.neotest ];
  xdg.configFile."nvim/plugin/neotest.lua".source = ./config.lua;
}
