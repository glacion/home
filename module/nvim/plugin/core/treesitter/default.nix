{ pkgs, ... }:
{
  programs.neovim.plugins = [
    pkgs.vimPlugins.nvim-treesitter
  ]
  ++ pkgs.vimPlugins.nvim-treesitter.allGrammars;
  xdg.configFile."nvim/plugin/treesitter.lua".source = ./config.lua;
}
