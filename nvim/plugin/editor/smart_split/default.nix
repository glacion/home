{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.smart-splits-nvim ];
  xdg.configFile."nvim/plugin/smart_split.lua".source = ./config.lua;
}
