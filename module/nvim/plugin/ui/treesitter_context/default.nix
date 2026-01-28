{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-treesitter-context ];
  xdg.configFile."nvim/plugin/treesitter_context.lua".source = ./config.lua;
}
