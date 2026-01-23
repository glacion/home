{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.snacks-nvim ];
  xdg.configFile."nvim/plugin/snack.lua".source = ./config.lua;
}
